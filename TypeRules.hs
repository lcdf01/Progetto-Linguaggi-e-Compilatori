-- File: TypeRules.hs
-- Type checker principale che attraversa l'AST generato dal parser.
-- CORRETTO: Corretti i pattern matching, l'estrazione dei nomi dei parametri
-- e le chiamate alla funzione di incremento/decremento.

module TypeRules where

import TypeEnv
import Grammatica.Abs
import Control.Monad (void, unless, when)
import Control.Monad.State
import Control.Monad.Except
import qualified Data.Map as Map

--------------------------------------------------------------------------------
-- FUNZIONI HELPER
--------------------------------------------------------------------------------

setCurrentPos :: SourcePos -> TypeCheck ()
setCurrentPos pos = modify $ \env -> env { currentPos = pos }

throwTypeError :: TypeError -> TypeCheck a
throwTypeError err = throwError [err]

enterScope :: TypeCheck ()
enterScope = modify $ \env -> env { varEnv = Map.empty : varEnv env }

exitScope :: TypeCheck ()
exitScope = modify $ \env -> env { varEnv = tail (varEnv env) }

enterLoop :: TypeCheck ()
enterLoop = modify $ \env -> env { inLoop = True }

exitLoop :: TypeCheck ()
exitLoop = modify $ \env -> env { inLoop = False }

addVariable :: String -> Type -> SourcePos -> Bool -> Bool -> TypeCheck ()
addVariable name vtype pos isParam isInit = do
    env <- get
    let currentScope = head (varEnv env)
    case Map.lookup name currentScope of
        Just oldVar -> let oldPos = varPos oldVar in throwTypeError (RedeclaredVariable name pos oldPos)
        Nothing     -> do
            let newVarInfo = VarInfo vtype pos isParam isInit
            let newScope = Map.insert name newVarInfo currentScope
            put $ env { varEnv = newScope : tail (varEnv env) }

addFunction :: String -> Type -> [Type] -> [String] -> SourcePos -> TypeCheck ()
addFunction name retType paramTypes paramNames pos = do
    env <- get
    case Map.lookup name (funEnv env) of
        Just oldFun -> let oldPos = funPos oldFun in throwTypeError (RedeclaredFunction name pos oldPos)
        Nothing     -> do
            let newFunInfo = FunInfo retType pos paramTypes paramNames
            put $ env { funEnv = Map.insert name newFunInfo (funEnv env) }

lookupVariable :: String -> SourcePos -> TypeCheck VarInfo
lookupVariable name pos = do
    env <- get
    let search [] = throwTypeError (UndeclaredVariable name pos)
        search (scope:scopes) = maybe (search scopes) return (Map.lookup name scope)
    search (varEnv env)

lookupFunction :: String -> SourcePos -> TypeCheck FunInfo
lookupFunction name pos = do
    env <- get
    case Map.lookup name (funEnv env) of
        Just funInfo -> return funInfo
        Nothing      -> throwTypeError (UndeclaredFunction name pos)

checkAssignment :: Type -> Type -> SourcePos -> TypeCheck ()
checkAssignment ltype rtype pos =
    unless (ltype == rtype) $ throwTypeError (InvalidAssignment ltype rtype pos)

checkLValue :: Positioned LExpr -> TypeCheck ()
checkLValue (Positioned pos (BasLExpr (Positioned _ (Id _)))) = return ()
checkLValue (Positioned pos (BasLExpr (Positioned _ (ArrayEl _ _)))) = return ()
checkLValue (Positioned pos (Deref _)) = return ()
checkLValue (Positioned pos _) = throwTypeError (NotLValue pos)

checkBooleanCondition :: Type -> SourcePos -> String -> TypeCheck ()
checkBooleanCondition TBool _ _ = return ()
checkBooleanCondition actualType pos context =
    throwTypeError (TypeMismatch TBool actualType pos context)

-- MODIFICA: Corretto il pattern matching per Break/Continue
checkJumpStatement :: Positioned JumpStmt -> TypeCheck ()
checkJumpStatement (Positioned pos Break) = do
    env <- get
    unless (inLoop env) $ throwTypeError (BreakOutsideLoop pos)
checkJumpStatement (Positioned pos Continue) = do
    env <- get
    unless (inLoop env) $ throwTypeError (ContinueOutsideLoop pos)

checkIncrementDecrement :: Type -> SourcePos -> TypeCheck Type
checkIncrementDecrement t pos | isNumericType t = return t
                              | otherwise = throwTypeError (InvalidOperation "++/--" t pos)

checkLogicalBinaryOp :: String -> Type -> Type -> SourcePos -> TypeCheck Type
checkLogicalBinaryOp op t1 t2 pos
    | t1 == TBool && t2 == TBool = return TBool
    | otherwise = throwTypeError (TypeMismatch TBool (if t1 /= TBool then t1 else t2) pos op)

checkLogicalUnaryOp :: String -> SourcePos -> Type -> TypeCheck Type
checkLogicalUnaryOp op pos TBool = return TBool
checkLogicalUnaryOp op pos t = throwTypeError (TypeMismatch TBool t pos op)

checkEqualityOp :: String -> Type -> Type -> SourcePos -> TypeCheck Type
checkEqualityOp op t1 t2 pos
    | t1 == t2 && (isNumericType t1 || isBooleanType t1 || isPointerType t1 || t1 == TString) = return TBool
    | otherwise = throwTypeError (InvalidOperation op t1 pos)

checkRelationalOp :: String -> Type -> Type -> SourcePos -> TypeCheck Type
checkRelationalOp op t1 t2 pos
    | isNumericType t1 && isNumericType t2 = return TBool
    | otherwise = throwTypeError (TypeMismatch TInt (if not (isNumericType t1) then t1 else t2) pos op)

checkArithmeticBinaryOp :: String -> Type -> Type -> SourcePos -> TypeCheck Type
checkArithmeticBinaryOp op t1 t2 pos
    | isNumericType t1 && isNumericType t2 =
        if t1 == TFloat || t2 == TFloat then return TFloat else return TInt
    | otherwise = throwTypeError (TypeMismatch TInt (if not (isNumericType t1) then t1 else t2) pos op)

checkArithmeticUnaryOp :: String -> SourcePos -> Type -> TypeCheck Type
checkArithmeticUnaryOp op pos t
    | isNumericType t = return t
    | otherwise = throwTypeError (TypeMismatch TInt t pos op)

checkReference :: SourcePos -> Type -> TypeCheck Type
checkReference _ t = return (TPointer t)

checkDereference :: SourcePos -> Type -> TypeCheck Type
checkDereference pos (TPointer t) = return t
checkDereference pos t = throwTypeError (InvalidPointerOp "dereference" t pos)

checkArrayAccess :: Type -> Type -> SourcePos -> TypeCheck Type
checkArrayAccess (TArray _ baseType) indexType pos
    | isIntegerType indexType = return baseType
    | otherwise = throwTypeError (TypeMismatch TInt indexType pos "array index")
checkArrayAccess (TArrayUndef baseType) indexType pos
    | isIntegerType indexType = return baseType
    | otherwise = throwTypeError (TypeMismatch TInt indexType pos "array index")
checkArrayAccess t _ pos = throwTypeError (InvalidArrayAccess t pos)

checkArrayLiteral :: Integer -> Type -> [Type] -> SourcePos -> TypeCheck Type
checkArrayLiteral size elemType elemTypes pos = do
    when (fromIntegral (length elemTypes) /= size && size >= 0) $
        throwTypeError (ArraySizeMismatch (fromIntegral size) (length elemTypes) pos)
    mapM_ (\actual -> unless (actual == elemType) $
        throwTypeError (InvalidArrayLiteral elemType elemTypes pos)) elemTypes
    if size < 0
        then return (TArray (length elemTypes) elemType)
        else return (TArray (fromIntegral size) elemType)

checkFunctionCall :: String -> [Type] -> SourcePos -> TypeCheck Type
checkFunctionCall name argTypes pos = do
    funInfo <- lookupFunction name pos
    let expectedTypes = funParams funInfo
    let retType = funRetType funInfo
    unless (argTypes == expectedTypes) $
        throwTypeError (FunctionCallError name expectedTypes argTypes pos)
    return retType

--------------------------------------------------------------------------------
-- LOGICA DI ATTRAVERSAMENTO DELL'AST
--------------------------------------------------------------------------------

typeCheckProgram :: Positioned Program -> Either [TypeError] TypeEnv
typeCheckProgram pprog =
    let initialState = initialEnv
    in case evalState (runExceptT (checkProgram pprog)) initialState of
        Left errs -> Left errs
        Right ()  -> Right (evalState get initialState)

checkProgram :: Positioned Program -> TypeCheck ()
checkProgram (Positioned pos (Prog decls)) = do
    setCurrentPos pos
    mapM_ checkDecl decls

checkDecl :: Positioned Decl -> TypeCheck ()
checkDecl (Positioned pos decl) = setCurrentPos pos >> case decl of
    Dfun (Positioned identPos (Ident fname)) params body -> do
        let paramTypes = map (convertType . \(Positioned _ (Param _ tspec)) -> tspec) params
        -- MODIFICA: Corretta l'estrazione dei nomi dei parametri
        let paramNames = map (\(Positioned _ (Param (Positioned _ (Ident name)) _)) -> name) params
        let retType = TVoid

        addFunction fname retType paramTypes paramNames identPos

        enterScope
        mapM_ checkParam params
        checkCompStmt body
        exitScope

    DvarGo varSpec -> checkVarSpec varSpec

checkParam :: Positioned Parameter -> TypeCheck ()
checkParam (Positioned p (Param (Positioned pIdent (Ident name)) tspec)) = do
    setCurrentPos p
    addVariable name (convertType tspec) pIdent True True

checkVarSpec :: Positioned VarSpec -> TypeCheck ()
checkVarSpec (Positioned pos spec) = setCurrentPos pos >> case spec of
    VarSpecSingleInit (Positioned identPos (Ident name)) tspec rexpr -> do
        let expectedType = convertType tspec
        actualType <- checkRExpr rexpr
        checkAssignment expectedType actualType (extractPos rexpr)
        addVariable name expectedType identPos False True

    VarSpecArrayInit (Positioned identPos (Ident name)) rexpr -> do
        actualType <- checkRExpr rexpr
        addVariable name actualType identPos False True

    VarSpecSingleNoInit (Positioned identPos (Ident name)) tspec -> do
        let varType = convertType tspec
        addVariable name varType identPos False False

checkCompStmt :: Positioned CompStmt -> TypeCheck ()
checkCompStmt (Positioned pos (BlockDecl items)) = do
    setCurrentPos pos
    enterScope
    mapM_ checkBlockItem items
    exitScope

checkBlockItem :: Positioned BlockItem -> TypeCheck ()
checkBlockItem (Positioned pos item) = setCurrentPos pos >> case item of
    DeclItem decl -> checkDecl decl
    StmtItem stmt -> checkStmt stmt

checkStmt :: Positioned Stmt -> TypeCheck ()
checkStmt (Positioned pos stmt) = setCurrentPos pos >> case stmt of
    Comp compStmt           -> checkCompStmt compStmt
    ProcCall funCall        -> void $ checkFunCall funCall
    Jmp jumpStmt            -> checkJumpStatement jumpStmt
    Iter iterStmt           -> checkIterStmt iterStmt
    Sel selStmt             -> checkSelectionStmt selStmt
    Assgn lexpr _ rexpr    -> do
        checkLValue lexpr
        ltype <- checkLExpr lexpr
        rtype <- checkRExpr rexpr
        checkAssignment ltype rtype pos
    LExprStmt lexpr         -> void $ checkLExpr lexpr
    DeclStmt varSpec        -> checkVarSpec varSpec
    StmtInc (Positioned p (Ident name)) -> lookupVariable name p >>= \v -> void $ checkIncrementDecrement (varType v) p
    StmtDec (Positioned p (Ident name)) -> lookupVariable name p >>= \v -> void $ checkIncrementDecrement (varType v) p

checkIterStmt :: Positioned IterStmt -> TypeCheck ()
checkIterStmt (Positioned pos iter) = setCurrentPos pos >> case iter of
    While cond stmt -> do
        condType <- checkRExpr cond
        checkBooleanCondition condType (extractPos cond) "while condition"
        enterLoop
        checkStmt stmt
        exitLoop
    DoWhile stmt cond -> do
        enterLoop
        checkStmt stmt
        exitLoop
        condType <- checkRExpr cond
        checkBooleanCondition condType (extractPos cond) "do-while condition"

checkSelectionStmt :: Positioned SelectionStmt -> TypeCheck ()
checkSelectionStmt (Positioned pos sel) = setCurrentPos pos >> case sel of
    IfNoElse cond stmt -> do
        condType <- checkRExpr cond
        checkBooleanCondition condType (extractPos cond) "if condition"
        checkStmt stmt
    IfElse cond thenStmt elseStmt -> do
        condType <- checkRExpr cond
        checkBooleanCondition condType (extractPos cond) "if condition"
        checkStmt thenStmt
        checkStmt elseStmt

checkRExpr :: Positioned RExpr -> TypeCheck Type
checkRExpr (Positioned pos expr) = do
    setCurrentPos pos
    case expr of
        Or  l r -> do { t1 <- checkRExpr l; t2 <- checkRExpr r; checkLogicalBinaryOp "||" t1 t2 pos }
        And l r -> do { t1 <- checkRExpr l; t2 <- checkRExpr r; checkLogicalBinaryOp "&&" t1 t2 pos }
        Not e   -> checkRExpr e >>= checkLogicalUnaryOp "!" pos
        Eq  l r -> do { t1 <- checkRExpr l; t2 <- checkRExpr r; checkEqualityOp "==" t1 t2 pos }
        Neq l r -> do { t1 <- checkRExpr l; t2 <- checkRExpr r; checkEqualityOp "!=" t1 t2 pos }
        Lt  l r -> do { t1 <- checkRExpr l; t2 <- checkRExpr r; checkRelationalOp "<" t1 t2 pos }
        LtE l r -> do { t1 <- checkRExpr l; t2 <- checkRExpr r; checkRelationalOp "<=" t1 t2 pos }
        Gt  l r -> do { t1 <- checkRExpr l; t2 <- checkRExpr r; checkRelationalOp ">" t1 t2 pos }
        GtE l r -> do { t1 <- checkRExpr l; t2 <- checkRExpr r; checkRelationalOp ">=" t1 t2 pos }
        Add l r -> do { t1 <- checkRExpr l; t2 <- checkRExpr r; checkArithmeticBinaryOp "+" t1 t2 pos }
        Sub l r -> do { t1 <- checkRExpr l; t2 <- checkRExpr r; checkArithmeticBinaryOp "-" t1 t2 pos }
        Mul l r -> do { t1 <- checkRExpr l; t2 <- checkRExpr r; checkArithmeticBinaryOp "*" t1 t2 pos }
        Div l r -> do { t1 <- checkRExpr l; t2 <- checkRExpr r; checkArithmeticBinaryOp "/" t1 t2 pos }
        Mod l r -> do { t1 <- checkRExpr l; t2 <- checkRExpr r; checkArithmeticBinaryOp "%" t1 t2 pos }
        Pow l r -> do { t1 <- checkRExpr l; t2 <- checkRExpr r; checkArithmeticBinaryOp "^" t1 t2 pos }
        Neg e   -> checkRExpr e >>= checkArithmeticUnaryOp "-" pos
        Ref l   -> checkLExpr l >>= checkReference pos
        FCall fc -> checkFunCall fc
        Int _    -> return TInt
        Char _   -> return TChar
        String _ -> return TString
        Float _  -> return TFloat
        Bool _   -> return TBool
        GoArrayLit s bt es -> do
            let elemType = convertBasicType (extractData bt)
            elemTypes <- mapM checkRExpr es
            checkArrayLiteral (extractData s) elemType elemTypes pos
        Lexpr le -> checkLExpr le

checkFunCall :: Positioned FunCall -> TypeCheck Type
checkFunCall (Positioned pos (Call (Positioned identPos (Ident name)) args)) = do
    setCurrentPos pos
    argTypes <- mapM checkRExpr args
    checkFunctionCall name argTypes identPos

-- | Type checking delle espressioni (l-values)
checkLExpr :: Positioned LExpr -> TypeCheck Type
checkLExpr (Positioned pos expr) = setCurrentPos pos >> case expr of
    Deref r      -> checkRExpr r >>= checkDereference pos
    -- MODIFICA: Corretta la chiamata a checkIncrementDecrement
    PreInc l     -> checkLExpr l >>= \ltype -> checkIncrementDecrement ltype pos
    PreDecr l    -> checkLExpr l >>= \ltype -> checkIncrementDecrement ltype pos
    PostInc l    -> checkLExpr l >>= \ltype -> checkIncrementDecrement ltype pos
    PostDecr l   -> checkLExpr l >>= \ltype -> checkIncrementDecrement ltype pos
    BasLExpr b   -> checkBLExpr b

checkBLExpr :: Positioned BLExpr -> TypeCheck Type
checkBLExpr (Positioned pos expr) = setCurrentPos pos >> case expr of
    ArrayEl (Positioned identPos (Ident name)) indexExpr -> do
        varInfo <- lookupVariable name identPos
        indexType <- checkRExpr indexExpr
        checkArrayAccess (varType varInfo) indexType pos
    Id (Positioned identPos (Ident name)) -> do
        varInfo <- lookupVariable name identPos
        return $ varType varInfo