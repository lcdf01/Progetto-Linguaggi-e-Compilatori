-- File: TypeRules.hs
-- Regole di tipo per il linguaggio imperativo con sintassi Go-like
-- A.A. 2024-25 - Progetto Linguaggi e Compilatori

module TypeRules where

import TypeEnv
import Grammatica.Abs
import qualified Grammatica.Abs as Abs
import Control.Monad (when, unless)
import Control.Monad.State
import Control.Monad.Except
import qualified Data.Map as Map

-- | Monade per il type checking
type TypeCheck = ExceptT TypeError (State TypeEnv)

-- | Operazioni base sull'ambiente

-- | Entra in un nuovo scope
enterScope :: TypeCheck ()
enterScope = modify $ \env -> env { varEnv = Map.empty : varEnv env }

-- | Esce da uno scope
exitScope :: TypeCheck ()
exitScope = modify $ \env -> env { varEnv = tail (varEnv env) }

-- | Entra in un ciclo
enterLoop :: TypeCheck ()
enterLoop = modify $ \env -> env { inLoop = True, loopDepth = loopDepth env + 1 }

-- | Esce da un ciclo
exitLoop :: TypeCheck ()
exitLoop = modify $ \env -> env { 
    loopDepth = max 0 (loopDepth env - 1),
    inLoop = loopDepth env > 1
}

-- | Imposta la posizione corrente
setCurrentLoc :: Loc -> TypeCheck ()
setCurrentLoc loc = modify $ \env -> env { currentLoc = loc }

-- | Ottiene la posizione corrente
getCurrentLoc :: TypeCheck Loc
getCurrentLoc = gets currentLoc

-- | Verifica se siamo in un ciclo
checkInLoop :: TypeCheck Bool
checkInLoop = gets inLoop

-- | Aggiunge una variabile al scope corrente
addVariable :: String -> Type -> Loc -> Bool -> Bool -> TypeCheck ()
addVariable name typ loc isParam isInit = do
    env <- get
    case varEnv env of
        (scope:scopes) -> 
            case Map.lookup name scope of
                Just oldVar -> throwError $ RedeclaredVariable name loc (varLoc oldVar)
                Nothing -> do
                    let newVar = VarInfo typ loc isParam isInit
                    let newScope = Map.insert name newVar scope
                    put env { varEnv = newScope : scopes }
        [] -> error "No scope available"

-- | Cerca una variabile negli scope
lookupVariable :: String -> Loc -> TypeCheck VarInfo
lookupVariable name loc = do
    env <- get
    case findInScopes name (varEnv env) of
        Just info -> return info
        Nothing -> throwError $ UndeclaredVariable name loc
  where
    findInScopes :: String -> [Map.Map String VarInfo] -> Maybe VarInfo
    findInScopes _ [] = Nothing
    findInScopes name (scope:scopes) = 
        case Map.lookup name scope of
            Just info -> Just info
            Nothing -> findInScopes name scopes

-- | Aggiunge una funzione all'ambiente
addFunction :: String -> Type -> [Type] -> [String] -> Loc -> TypeCheck ()
addFunction name funType paramTypes paramNames loc = do
    env <- get
    case Map.lookup name (funEnv env) of
        Just oldFun -> throwError $ RedeclaredFunction name loc (funLoc oldFun)
        Nothing -> do
            let newFun = FunInfo funType loc paramTypes paramNames
            put env { funEnv = Map.insert name newFun (funEnv env) }

-- | Cerca una funzione
lookupFunction :: String -> Loc -> TypeCheck FunInfo
lookupFunction name loc = do
    env <- get
    case Map.lookup name (funEnv env) of
        Just info -> return info
        Nothing -> throwError $ UndeclaredFunction name loc

-- | REGOLE DI COMPATIBILITÀ E PROMOZIONE TIPI

-- | Verifica compatibilità diretta di tipi
isDirectlyCompatible :: Type -> Type -> Bool
isDirectlyCompatible t1 t2 = t1 == t2

-- | Verifica se è possibile una promozione automatica
canPromote :: Type -> Type -> Bool
canPromote TChar TInt = True      -- char -> int
canPromote TChar TFloat = True    -- char -> float
canPromote TInt TFloat = True     -- int -> float
canPromote _ _ = False

-- | Verifica compatibilità con promozioni automatiche
isCompatible :: Type -> Type -> Bool
isCompatible t1 t2 = isDirectlyCompatible t1 t2 || canPromote t1 t2 || canPromote t2 t1

-- | Ottiene il tipo risultante dalla promozione
promoteTypes :: Type -> Type -> Type
promoteTypes t1 t2
    | t1 == t2 = t1
    | TFloat `elem` [t1, t2] = TFloat  -- Promozione a float
    | TInt `elem` [t1, t2] = TInt      -- Promozione a int
    | otherwise = t1  -- Fallback

-- | REGOLE PER LE OPERAZIONI ARITMETICHE

-- | Verifica validità operazione binaria aritmetica
checkArithmeticBinaryOp :: String -> Type -> Type -> Loc -> TypeCheck Type
checkArithmeticBinaryOp op t1 t2 loc
    | not (isNumericType t1) = throwError $ InvalidOperation op t1 loc
    | not (isNumericType t2) = throwError $ InvalidOperation op t2 loc
    | isCompatible t1 t2 = return $ promoteTypes t1 t2
    | otherwise = throwError $ TypeMismatch t1 t2 loc ("arithmetic operation " ++ op)

-- | Verifica validità operazione unaria aritmetica
checkArithmeticUnaryOp :: String -> Type -> Loc -> TypeCheck Type
checkArithmeticUnaryOp op t loc
    | not (isNumericType t) = throwError $ InvalidOperation op t loc
    | otherwise = return t

-- | REGOLE PER LE OPERAZIONI RELAZIONALI

-- | Verifica validità operazione relazionale
checkRelationalOp :: String -> Type -> Type -> Loc -> TypeCheck Type
checkRelationalOp op t1 t2 loc
    | not (isNumericType t1) = throwError $ InvalidOperation op t1 loc
    | not (isNumericType t2) = throwError $ InvalidOperation op t2 loc
    | isCompatible t1 t2 = return TBool
    | otherwise = throwError $ TypeMismatch t1 t2 loc ("relational operation " ++ op)

-- | Verifica validità operazione di uguaglianza  
checkEqualityOp :: String -> Type -> Type -> Loc -> TypeCheck Type
checkEqualityOp op t1 t2 loc
    | isCompatible t1 t2 = return TBool
    | otherwise = throwError $ TypeMismatch t1 t2 loc ("equality operation " ++ op)

-- | REGOLE PER LE OPERAZIONI LOGICHE

-- | Verifica validità operazione logica binaria
checkLogicalBinaryOp :: String -> Type -> Type -> Loc -> TypeCheck Type  
checkLogicalBinaryOp op t1 t2 loc
    | not (isBooleanType t1) = throwError $ InvalidOperation op t1 loc
    | not (isBooleanType t2) = throwError $ InvalidOperation op t2 loc
    | otherwise = return TBool

-- | Verifica validità operazione logica unaria
checkLogicalUnaryOp :: String -> Type -> Loc -> TypeCheck Type
checkLogicalUnaryOp op t loc
    | not (isBooleanType t) = throwError $ InvalidOperation op t loc
    | otherwise = return TBool

-- | REGOLE PER GLI ARRAY

-- | Verifica accesso ad array
checkArrayAccess :: Type -> Type -> Loc -> TypeCheck Type
checkArrayAccess arrType indexType loc = do
    -- Verifica che sia un array
    baseType <- case getArrayBaseType arrType of
        Just bt -> return bt
        Nothing -> throwError $ InvalidArrayAccess arrType loc
    
    -- Verifica che l'indice sia intero
    unless (isIntegerType indexType) $
        throwError $ TypeMismatch TInt indexType loc "array index"
    
    return baseType

-- | Verifica literal di array
checkArrayLiteral :: Int -> Type -> [Type] -> Loc -> TypeCheck Type
checkArrayLiteral size elemType elemTypes loc = do
    -- Verifica che tutti gli elementi abbiano il tipo corretto
    let incompatibleTypes = filter (not . isCompatible elemType) elemTypes
    unless (null incompatibleTypes) $
        throwError $ InvalidArrayLiteral elemType incompatibleTypes loc
    
    -- Verifica dimensione se specificata
    when (size > 0 && length elemTypes /= size) $
        throwError $ ArraySizeMismatch size (length elemTypes) loc
    
    return $ TArray (length elemTypes) elemType

-- | REGOLE PER I PUNTATORI

-- | Verifica operazione di dereferenziazione
checkDereference :: Type -> Loc -> TypeCheck Type
checkDereference ptrType loc = do
    case getPointerBaseType ptrType of
        Just baseType -> return baseType
        Nothing -> throwError $ InvalidPointerOp ptrType loc

-- | Verifica operazione di referenziazione
checkReference :: Type -> Loc -> TypeCheck Type
checkReference baseType loc = return $ TPointer baseType

-- | REGOLE PER LE ASSEGNAZIONI

-- | Verifica compatibilità assegnazione
checkAssignmentCompatibility :: Type -> Type -> Loc -> TypeCheck ()
checkAssignmentCompatibility ltype rtype loc
    | isCompatible rtype ltype = return ()
    | otherwise = throwError $ InvalidAssignment ltype rtype loc

-- | Verifica che un'espressione sia un lvalue valido
checkLValue :: LExpr -> TypeCheck ()
checkLValue expr = do
    case expr of
        BasLExpr (Id _) -> return ()
        BasLExpr (ArrayEl _ _) -> return ()
        Deref _ -> return ()
        PreInc _ -> return ()
        PreDecr _ -> return ()
        PostInc _ -> return ()
        PostDecr _ -> return ()
        _ -> do
            loc <- getCurrentLoc
            throwError $ NotLValue (show expr) loc

-- | REGOLE PER LE CHIAMATE DI FUNZIONE

-- | Verifica chiamata di funzione
checkFunctionCall :: String -> [Type] -> Loc -> TypeCheck Type
checkFunctionCall name argTypes loc = do
    funInfo <- lookupFunction name loc
    let expectedTypes = funParams funInfo
    
    -- Verifica numero di argomenti
    when (length argTypes /= length expectedTypes) $
        throwError $ FunctionCallError name expectedTypes argTypes loc
    
    -- Verifica compatibilità tipi argomenti
    let typeChecks = zipWith isCompatible argTypes expectedTypes
    unless (and typeChecks) $
        throwError $ FunctionCallError name expectedTypes argTypes loc
    
    -- Estrae il tipo di ritorno dalla funzione
    case funType funInfo of
        TFunction _ retType -> return retType
        _ -> error "Function should have function type"

-- | REGOLE PER I COSTRUTTI DI CONTROLLO

-- | Verifica condizione booleana
checkBooleanCondition :: Type -> Loc -> String -> TypeCheck ()
checkBooleanCondition condType loc context = do
    unless (isBooleanType condType) $
        throwError $ TypeMismatch TBool condType loc context

-- | Verifica statement break/continue
checkJumpStatement :: JumpStmt -> Loc -> TypeCheck ()
checkJumpStatement Break loc = do
    inLoop <- checkInLoop
    unless inLoop $ throwError $ BreakOutsideLoop loc
checkJumpStatement Continue loc = do
    inLoop <- checkInLoop  
    unless inLoop $ throwError $ ContinueOutsideLoop loc

-- | REGOLE PER GLI OPERATORI DI INCREMENTO/DECREMENTO

-- | Verifica operatori di incremento/decremento
checkIncrementDecrement :: Type -> Loc -> TypeCheck Type
checkIncrementDecrement t loc
    | isIntegerType t = return t
    | otherwise = throwError $ InvalidOperation "increment/decrement" t loc

-- | REGOLE PER LE OPERAZIONI DI ASSEGNAZIONE COMPOSTA

-- | Verifica operazione di assegnazione composta
checkCompoundAssignment :: Assignment_op -> Type -> Type -> Loc -> TypeCheck ()
checkCompoundAssignment op ltype rtype loc = do
    case op of
        Assign -> checkAssignmentCompatibility ltype rtype loc
        AssgnAdd -> checkArithCompoundAssign "addition" ltype rtype loc
        AssgnSub -> checkArithCompoundAssign "subtraction" ltype rtype loc
        AssgnMul -> checkArithCompoundAssign "multiplication" ltype rtype loc
        AssgnDiv -> checkArithCompoundAssign "division" ltype rtype loc
        AssgnPow -> checkArithCompoundAssign "power" ltype rtype loc
        AssgnAnd -> checkLogicalCompoundAssign "logical and" ltype rtype loc
        AssgnOr -> checkLogicalCompoundAssign "logical or" ltype rtype loc
  where
    checkArithCompoundAssign opName lt rt loc = do
        unless (isNumericType lt && isNumericType rt) $
            throwError $ InvalidOperation opName lt loc
        unless (isCompatible rt lt) $
            throwError $ InvalidAssignment lt rt loc
    
    checkLogicalCompoundAssign opName lt rt loc = do
        unless (isBooleanType lt && isBooleanType rt) $
            throwError $ InvalidOperation opName lt loc