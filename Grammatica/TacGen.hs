-- File: Grammatica/TacGen.hs
-- CORREZIONE FINALE: Usa 'varEnv' invece di 'variables' e gestisce lo stack di scope.

{-# LANGUAGE LambdaCase #-}

module Grammatica.TacGen (genProgram) where

import qualified Grammatica.Abs as A
import Grammatica.Tac
import TypeEnv
import qualified Data.Map as Map
import Data.Monoid
import Control.Monad.State
import Control.Monad.Reader
import Data.Maybe (mapMaybe) -- Necessario per la ricerca negli scope

type M a = ReaderT TypeEnv (State GenS) a
data GenS = GenS { ixs :: Int, lxs :: Int }

data Address
  = AddrVar Temp A.SourcePos
  | AddrArray Temp A.SourcePos Temp
  | AddrPtr Temp

freshT :: M Temp
freshT = lift $ do s <- get; put s{ixs = ixs s + 1}; pure ("t" ++ show (ixs s))

freshL :: String -> M Label
freshL base = lift $ do s <- get; put s{lxs = lxs s + 1}; pure (base ++ show (lxs s))

-- CORREZIONE: Usa 'varEnv' e cerca in tutti gli scope.
findVarInScopes :: String -> [Map.Map String VarInfo] -> Maybe VarInfo
findVarInScopes name [] = Nothing
findVarInScopes name (currentScope:outerScopes) =
    case Map.lookup name currentScope of
        Just varInfo -> Just varInfo -- Trovato nello scope corrente
        Nothing      -> findVarInScopes name outerScopes -- Cerca negli scope esterni

lookupVarPos :: String -> M A.SourcePos
lookupVarPos name = do
  env <- ask
  -- CORREZIONE: Usa il nome di campo corretto 'varEnv'.
  case findVarInScopes name (varEnv env) of
    Just varInfo -> pure (varPos varInfo) -- Usa il selettore di campo corretto 'varPos'
    Nothing      -> error $ "TACGen: Var " ++ name ++ " not found. This should not happen after successful type checking."

genProgram :: A.Program -> TypeEnv -> Program
genProgram ast env = Program $ evalState (runReaderT (genProg ast) env) (GenS 0 0)

genProg :: A.Program -> M [Instr]
genProg (A.Prog decls) = fmap concat (mapM genDecl decls)

genDecl :: A.Positioned A.Decl -> M [Instr]
genDecl posDecl = case A.value posDecl of
  A.Dfun (A.Positioned _ fid) params body -> do
    let fName = extractIdent fid
    lEntry <- freshL (fName ++ "_entry")
    lExit  <- freshL (fName ++ "_exit")
    bodyI  <- genCompStmt body
    pure $ [ILabel lEntry] <> bodyI <> [ILabel lExit, IReturn Nothing]
  A.DvarGo _ -> pure []

genCompStmt :: A.Positioned A.CompStmt -> M [Instr]
genCompStmt posCompStmt = case A.value posCompStmt of
    A.BlockDecl items -> fmap concat (mapM genBlockItem items)

genBlockItem :: A.Positioned A.BlockItem -> M [Instr]
genBlockItem posItem = case A.value posItem of
    A.DeclItem decl -> genDecl decl
    A.StmtItem stmt -> genStmt stmt

genStmt :: A.Positioned A.Stmt -> M [Instr]
genStmt posStmt = case A.value posStmt of
  A.Assgn lval _ rval -> do
    (iaddr, addr) <- genLExpr lval
    (tr, ir) <- genRExpr rval
    let assignInstr = case addr of
          AddrVar varName pos      -> [ICopy varName (T tr)]
          AddrArray base pos index -> [IStore (Var base pos) (T index) (T tr)]
          AddrPtr ptrTemp          -> [IStorePtr (T ptrTemp) (T tr)]
    pure $ iaddr <> ir <> assignInstr
  
  -- La sezione Sel/Iter/LExprStmt e altre non cambia...
  A.Sel (A.Positioned _ sel) -> case sel of
    A.IfElse cond thenStmt elseStmt -> do
        lThen <- freshL "then_"; lElse <- freshL "else_"; lEnd  <- freshL "endif_"
        ig <- genBool cond lThen lElse
        thenI <- genStmt thenStmt
        elseI <- genStmt elseStmt
        pure $ ig <> [ILabel lThen] <> thenI <> [IGoto lEnd, ILabel lElse] <> elseI <> [ILabel lEnd]
    _ -> pure []
  _ -> pure []

genRExpr :: A.Positioned A.RExpr -> M (Temp, [Instr])
genRExpr posExpr = case A.value posExpr of
  A.Int (A.Positioned _ i)      -> do t <- freshT; pure (t, [ICopy t (CInt i)])
  A.Float (A.Positioned _ d)    -> do t <- freshT; pure (t, [ICopy t (CFloat d)])
  A.String (A.Positioned _ s)   -> do t <- freshT; pure (t, [ICopy t (CString s)])
  A.Lexpr lval -> do
    (iaddr, addr) <- genLExpr lval
    t <- freshT
    let loadInstr = case addr of
          AddrVar varName pos      -> [ICopy t (Var varName pos)]
          AddrArray base pos index -> [ILoad t (Var base pos) (T index)]
          AddrPtr ptrTemp          -> [ILoadPtr t (T ptrTemp)]
    pure (t, iaddr <> loadInstr)
  _ -> genBinOpFromRExpr posExpr

genLExpr :: A.Positioned A.LExpr -> M ([Instr], Address)
genLExpr posLexpr = case A.value posLexpr of
  A.BasLExpr (A.Positioned _ (A.Id (A.Positioned _ ident))) -> do
    pos <- lookupVarPos (extractIdent ident)
    pure ([], AddrVar (extractIdent ident) pos)
  A.BasLExpr (A.Positioned _ (A.ArrayEl (A.Positioned _ ident) indexExpr)) -> do
    pos <- lookupVarPos (extractIdent ident)
    (ti, ii) <- genRExpr indexExpr
    pure (ii, AddrArray (extractIdent ident) pos ti)
  A.Deref rExpr -> do
    (t_ptr, i_ptr) <- genRExpr rExpr
    pure (i_ptr, AddrPtr t_ptr)
  _ -> error "Unsupported L-value type"

genBool :: A.Positioned A.RExpr -> Label -> Label -> M [Instr]
genBool posExpr lTrue lFalse = case A.value posExpr of
  A.Or a b -> do
    lMid <- freshL "sc_or_"; ia <- genBool a lTrue lMid; ib <- genBool b lTrue lFalse
    pure (ia <> [ILabel lMid] <> ib)
  _ -> do (t, ie) <- genRExpr posExpr; pure (ie <> [IIfTrue (T t) lTrue, IGoto lFalse])

genBinOpFromRExpr :: A.Positioned A.RExpr -> M (Temp, [Instr])
genBinOpFromRExpr (A.Positioned _ expr) = do
    let (op, l, r) = case expr of
          A.Add l r -> (Add, l, r); A.Sub l r -> (Sub, l, r)
          A.Div l r -> (Div, l, r); A.Mul l r -> (Mul, l, r)
          A.Eq  l r -> (Eq, l, r)
          _ -> error "Not a binary op"
    (ta, ia) <- genRExpr l; (tb, ib) <- genRExpr r; t <- freshT
    pure (t, ia <> ib <> [IBin t op (T ta) (T tb)])

extractIdent :: A.Ident -> String
extractIdent (A.Ident s) = s

toBool :: A.Boolean -> Bool
toBool A.Boolean_true = True
toBool A.Boolean_false = False