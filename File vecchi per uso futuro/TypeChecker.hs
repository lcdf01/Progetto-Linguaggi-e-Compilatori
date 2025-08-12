-- File: TypeChecker.hs  
-- Type checker principale per il linguaggio imperativo con sintassi Go-like
-- A.A. 2024-25 - Progetto Linguaggi e Compilatori

module TypeChecker where

import TypeEnv
import TypeRules
import Grammatica.Abs
import qualified Grammatica.Abs as Abs
import Control.Monad (when, unless)
import Control.Monad.State
import Control.Monad.Except
import qualified Data.Map as Map

-- | Funzione principale per il type checking di un programma
typeCheckProgram :: Program -> Either TypeError TypeEnv
typeCheckProgram prog = evalState (runExceptT (checkProgram prog)) initialEnv

-- | Type checking del programma
checkProgram :: Program -> TypeCheck TypeEnv
checkProgram (Prog decls) = do
    mapM_ checkDecl decls
    get

-- | Type checking delle dichiarazioni
checkDecl :: Decl -> TypeCheck ()
checkDecl (Dfun (Ident fname) params body) = do
    loc <- getCurrentLoc
    let paramTypes = map (\(Param _ tspec) -> convertType tspec) params
    let paramNames = map (\(Param (Ident n) _) -> n) params
    let funType = TFunction paramTypes TVoid  -- Le procedure sono void
    
    -- Aggiunge la funzione all'ambiente
    addFunction fname funType paramTypes paramNames loc
    
    -- Entra in un nuovo scope per il corpo della funzione
    enterScope
    
    -- Aggiunge i parametri al scope locale
    mapM_ addParam params
    
    -- Type check del corpo
    checkCompStmt body
    
    -- Esce dallo scope
    exitScope
  where
    addParam (Param (Ident name) tspec) = do
        loc <- getCurrentLoc
        addVariable name (convertType tspec) loc True True

checkDecl (DvarGo varSpec) = do
    checkVarSpec varSpec

-- | Type checking delle specifiche di variabile
checkVarSpec :: VarSpec -> TypeCheck ()
checkVarSpec (VarSpecSingleInit (Ident name) tspec rexpr) = do
    loc <- getCurrentLoc
    let expectedType = convertType tspec
    actualType <- checkRExpr rexpr
    
    -- Verifica compatibilità tipi
    unless (isCompatible actualType expectedType) $
        throwError $ TypeMismatch expectedType actualType loc "variable initialization"
    
    addVariable name expectedType loc False True

checkVarSpec (VarSpecArrayInit (Ident name) rexpr) = do
    loc <- getCurrentLoc
    actualType <- checkRExpr rexpr
    
    -- Il tipo viene inferito dall'espressione (per array literals)
    addVariable name actualType loc False True

checkVarSpec (VarSpecSingleNoInit (Ident name) tspec) = do
    loc <- getCurrentLoc
    let varType = convertType tspec
    addVariable name varType loc False False

-- | Type checking dei compound statements
checkCompStmt :: CompStmt -> TypeCheck ()
checkCompStmt (BlockDecl items) = do
    enterScope
    mapM_ checkBlockItem items
    exitScope

-- | Type checking degli elementi di blocco
checkBlockItem :: BlockItem -> TypeCheck ()
checkBlockItem (DeclItem decl) = checkDecl decl
checkBlockItem (StmtItem stmt) = checkStmt stmt

-- | Type checking degli statement
checkStmt :: Stmt -> TypeCheck ()
checkStmt (Comp compStmt) = checkCompStmt compStmt

checkStmt (ProcCall funCall) = do
    _ <- checkFunCall funCall
    return ()

checkStmt (Jmp jumpStmt) = do
    loc <- getCurrentLoc
    checkJumpStatement jumpStmt loc

checkStmt (Iter iterStmt) = checkIterStmt iterStmt

checkStmt (Sel selStmt) = checkSelectionStmt selStmt

checkStmt (Assgn lexpr assignOp rexpr) = do
    loc <- getCurrentLoc
    
    -- Verifica che lexpr sia un lvalue valido
    checkLValue lexpr
    
    -- Type check delle espressioni
    ltype <- checkLExpr lexpr
    rtype <- checkRExpr rexpr
    
    -- Verifica compatibilità assegnazione
    checkCompoundAssignment assignOp ltype rtype loc

checkStmt (LExprStmt lexpr) = do
    _ <- checkLExpr lexpr
    return ()

checkStmt (DeclStmt varSpec) = checkVarSpec varSpec

checkStmt (StmtInc (Ident name)) = do
    loc <- getCurrentLoc
    varInfo <- lookupVariable name loc
    _ <- checkIncrementDecrement (varType varInfo) loc
    return ()

checkStmt (StmtDec (Ident name)) = do
    loc <- getCurrentLoc
    varInfo <- lookupVariable name loc
    _ <- checkIncrementDecrement (varType varInfo) loc
    return ()

-- | Type checking degli statement di iterazione
checkIterStmt :: IterStmt -> TypeCheck ()
checkIterStmt (While condExpr stmt) = do
    loc <- getCurrentLoc
    condType <- checkRExpr condExpr
    checkBooleanCondition condType loc "while condition"
    
    enterLoop
    checkStmt stmt
    exitLoop

checkIterStmt (DoWhile stmt condExpr) = do
    loc <- getCurrentLoc
    
    enterLoop
    checkStmt stmt
    exitLoop
    
    condType <- checkRExpr condExpr
    checkBooleanCondition condType loc "do-while condition"

-- | Type checking degli statement di selezione
checkSelectionStmt :: SelectionStmt -> TypeCheck ()
checkSelectionStmt (IfNoElse condExpr stmt) = do
    loc <- getCurrentLoc
    condType <- checkRExpr condExpr
    checkBooleanCondition condType loc "if condition"
    checkStmt stmt

checkSelectionStmt (IfElse condExpr thenStmt elseStmt) = do
    loc <- getCurrentLoc
    condType <- checkRExpr condExpr
    checkBooleanCondition condType loc "if condition"
    checkStmt thenStmt
    checkStmt elseStmt

-- | Type checking delle espressioni right-value
checkRExpr :: RExpr -> TypeCheck Type
checkRExpr (Or lexpr rexpr) = do
    loc <- getCurrentLoc
    ltype <- checkRExpr lexpr
    rtype <- checkRExpr rexpr
    checkLogicalBinaryOp "||" ltype rtype loc

checkRExpr (And lexpr rexpr) = do
    loc <- getCurrentLoc
    ltype <- checkRExpr lexpr
    rtype <- checkRExpr rexpr
    checkLogicalBinaryOp "&&" ltype rtype loc

checkRExpr (Not expr) = do
    loc <- getCurrentLoc
    exprType <- checkRExpr expr
    checkLogicalUnaryOp "!" exprType loc

checkRExpr (Eq lexpr rexpr) = do
    loc <- getCurrentLoc
    ltype <- checkRExpr lexpr
    rtype <- checkRExpr rexpr
    checkEqualityOp "==" ltype rtype loc

checkRExpr (Neq lexpr rexpr) = do
    loc <- getCurrentLoc
    ltype <- checkRExpr lexpr
    rtype <- checkRExpr rexpr
    checkEqualityOp "!=" ltype rtype loc

checkRExpr (Lt lexpr rexpr) = do
    loc <- getCurrentLoc
    ltype <- checkRExpr lexpr
    rtype <- checkRExpr rexpr
    checkRelationalOp "<" ltype rtype loc

checkRExpr (LtE lexpr rexpr) = do
    loc <- getCurrentLoc
    ltype <- checkRExpr lexpr
    rtype <- checkRExpr rexpr
    checkRelationalOp "<=" ltype rtype loc

checkRExpr (Gt lexpr rexpr) = do
    loc <- getCurrentLoc
    ltype <- checkRExpr lexpr
    rtype <- checkRExpr rexpr
    checkRelationalOp ">" ltype rtype loc

checkRExpr (GtE lexpr rexpr) = do
    loc <- getCurrentLoc
    ltype <- checkRExpr lexpr
    rtype <- checkRExpr rexpr
    checkRelationalOp ">=" ltype rtype loc

checkRExpr (Add lexpr rexpr) = do
    loc <- getCurrentLoc
    ltype <- checkRExpr lexpr
    rtype <- checkRExpr rexpr
    checkArithmeticBinaryOp "+" ltype rtype loc

checkRExpr (Sub lexpr rexpr) = do
    loc <- getCurrentLoc
    ltype <- checkRExpr lexpr
    rtype <- checkRExpr rexpr
    checkArithmeticBinaryOp "-" ltype rtype loc

checkRExpr (Mul lexpr rexpr) = do
    loc <- getCurrentLoc
    ltype <- checkRExpr lexpr
    rtype <- checkRExpr rexpr
    checkArithmeticBinaryOp "*" ltype rtype loc

checkRExpr (Div lexpr rexpr) = do
    loc <- getCurrentLoc
    ltype <- checkRExpr lexpr
    rtype <- checkRExpr rexpr
    -- TODO: Aggiungere controllo divisione per zero se è un literal
    checkArithmeticBinaryOp "/" ltype rtype loc

checkRExpr (Mod lexpr rexpr) = do
    loc <- getCurrentLoc
    ltype <- checkRExpr lexpr
    rtype <- checkRExpr rexpr
    -- Il modulo richiede tipi interi
    unless (isIntegerType ltype && isIntegerType rtype) $
        throwError $ InvalidOperation "%" ltype loc
    return $ promoteTypes ltype rtype

checkRExpr (Pow lexpr rexpr) = do
    loc <- getCurrentLoc
    ltype <- checkRExpr lexpr
    rtype <- checkRExpr rexpr
    checkArithmeticBinaryOp "^" ltype rtype loc

checkRExpr (Neg expr) = do
    loc <- getCurrentLoc
    exprType <- checkRExpr expr
    checkArithmeticUnaryOp "-" exprType loc

checkRExpr (Ref lexpr) = do
    loc <- getCurrentLoc
    exprType <- checkLExpr lexpr
    checkReference exprType loc

checkRExpr (FCall funCall) = checkFunCall funCall

checkRExpr (Int _) = return TInt
checkRExpr (Char _) = return TChar
checkRExpr (String _) = return TString
checkRExpr (Float _) = return TFloat
checkRExpr (Bool _) = return TBool

checkRExpr (GoArrayLit size baseType exprs) = do
    loc <- getCurrentLoc
    let elemType = convertBasicType baseType
    elemTypes <- mapM checkRExpr exprs
    checkArrayLiteral (fromIntegral size) elemType elemTypes loc

checkRExpr (Lexpr lexpr) = checkLExpr lexpr

-- | Type checking delle chiamate di funzione
checkFunCall :: FunCall -> TypeCheck Type
checkFunCall (Call (Ident name) args) = do
    loc <- getCurrentLoc
    argTypes <- mapM checkRExpr args
    checkFunctionCall name argTypes loc

-- | Type checking delle espressioni left-value
checkLExpr :: LExpr -> TypeCheck Type
checkLExpr (Deref rexpr) = do
    loc <- getCurrentLoc
    exprType <- checkRExpr rexpr
    checkDereference exprType loc

checkLExpr (PreInc lexpr) = do
    loc <- getCurrentLoc
    exprType <- checkLExpr lexpr
    checkIncrementDecrement exprType loc

checkLExpr (PreDecr lexpr) = do
    loc <- getCurrentLoc
    exprType <- checkLExpr lexpr
    checkIncrementDecrement exprType loc

checkLExpr (PostInc lexpr) = do
    loc <- getCurrentLoc
    exprType <- checkLExpr lexpr
    checkIncrementDecrement exprType loc

checkLExpr (PostDecr lexpr) = do
    loc <- getCurrentLoc
    exprType <- checkLExpr lexpr
    checkIncrementDecrement exprType loc

checkLExpr (BasLExpr blexpr) = checkBLExpr blexpr

-- | Type checking delle espressioni base left-value
checkBLExpr :: BLExpr -> TypeCheck Type
checkBLExpr (ArrayEl (Ident name) indexExpr) = do
    loc <- getCurrentLoc
    varInfo <- lookupVariable name loc
    indexType <- checkRExpr indexExpr
    checkArrayAccess (varType varInfo) indexType loc

checkBLExpr (Id (Ident name)) = do
    loc <- getCurrentLoc
    varInfo <- lookupVariable name loc
    return $ varType varInfo

-- | Funzioni di utilità per l'estrazione di informazioni di posizione dall'AST

-- | Estrae informazioni di posizione da un token (implementazione semplificata)
-- In una implementazione completa, queste informazioni dovrebbero essere
-- estratte dal lexer/parser e associate agli elementi dell'AST
extractLoc :: String -> Loc
extractLoc _ = Loc 1 1 ""  -- Placeholder - da migliorare con info reali dal parser

-- | Wrapper per eseguire il type checking con gestione degli errori
runTypeChecker :: Program -> IO ()
runTypeChecker prog = do
    case typeCheckProgram prog of
        Left err -> do
            putStrLn "Type checking failed:"
            putStrLn $ prettyPrintError err
        Right env -> do
            putStrLn "Type checking successful!"
            -- Qui si potrebbe stampare informazioni sull'ambiente finale
            return ()

-- | Funzione per ottenere il tipo di una variabile (utility per il TAC generator)
getVariableType :: String -> TypeEnv -> Maybe Type
getVariableType name env = do
    let findInScopes [] = Nothing
        findInScopes (scope:scopes) = 
            case Map.lookup name scope of
                Just varInfo -> Just (varType varInfo)
                Nothing -> findInScopes scopes
    findInScopes (varEnv env)

-- | Funzione per ottenere informazioni su una funzione
getFunctionInfo :: String -> TypeEnv -> Maybe FunInfo
getFunctionInfo name env = Map.lookup name (funEnv env)

-- | Verifica se un identificatore è dichiarato nell'ambiente corrente
isDeclared :: String -> TypeEnv -> Bool
isDeclared name env = 
    case getVariableType name env of
        Just _ -> True
        Nothing -> Map.member name (funEnv env)