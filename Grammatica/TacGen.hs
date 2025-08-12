{-# LANGUAGE LambdaCase #-}

module Grammatica.TacGen (genProgram) where
import qualified Grammatica.Abs as A      -- adattalo ai tuoi nomi
import Grammatica.Tac
import Data.Monoid
import Control.Monad.State

type M = State GenS
data GenS = GenS { ixs :: Int, lxs :: Int }

freshT :: M Temp
freshT = do s <- get; put s{ixs = ixs s + 1}; pure ("t" ++ show (ixs s))
freshL :: String -> M Label
freshL base = do s <- get; put s{lxs = lxs s + 1}; pure (base ++ show (lxs s))

emit :: Instr -> M [Instr]
emit i = pure [i]

-- Entry
genProgram :: A.Prog -> Program
genProgram ast = Program $ evalState (genProg ast) (GenS 0 0)

-- Esempio: completa con i tuoi costruttori AST
genProg :: A.Prog -> M [Instr]
genProg (A.Prog decls) = fmap concat (mapM genDecl decls)

genDecl :: A.Positioned A.Decl -> M [Instr]
genDecl d = case A.value d of
  A.Dfun fid params body -> do
    let fName = identName fid
    lEntry <- freshL (fName ++ "_entry_")
    lExit  <- freshL (fName ++ "_exit_")
    bodyI  <- genBlock body lExit
    pure $ [ILabel lEntry] <> bodyI <> [ILabel lExit, IReturn Nothing]
  _ -> pure []

genBlock :: A.Positioned A.BlockDecl -> Label -> M [Instr]
genBlock blk lExit = fmap concat (mapM genStmt (extractStmts blk)) >>= \is -> pure (is <> [ILabel lExit])

genStmt :: A.Positioned A.CompStmt -> M [Instr]
genStmt s = case A.value s of
  A.Assign l r -> do
    (tr, ir) <- genR r
    case l of
      A.Id x -> do
        -- lvalue prima di rvalue: qui l'address di x sarebbe già "risolto"
        pure $ ir <> [ICopy (toTempVar x) tr]
      A.ArrayEl x idx -> do
        (ti, ii) <- genR idx
        pure $ ir <> ii <> [IStore (Var (identName x)) ti tr]
  A.IfThen g b -> genGuard g =<< genBlock b =<< freshL "endif_"
  A.IfThenElse g bt be -> do
    lThen <- freshL "then_"; lElse <- freshL "else_"; lEnd <- freshL "endif_"
    (tg, ig) <- genBool g lThen lElse
    btI <- genBlock bt lEnd
    beI <- genBlock be lEnd
    pure $ ig <> [ILabel lThen] <> btI <> [IGoto lEnd, ILabel lElse] <> beI <> [ILabel lEnd]
  A.While g b -> do
    lCond <- freshL "cond_"; lBody <- freshL "body_"; lEnd <- freshL "wend_"
    (tg, ig) <- genBool g lBody lEnd
    bI <- genBlock b lCond
    pure $ [ILabel lCond] <> ig <> [ILabel lBody] <> bI <> [IGoto lCond, ILabel lEnd]
  A.ExprStmt e -> snd <$> genR e
  A.Return Nothing -> pure [IReturn Nothing]
  A.Return (Just e) -> do (t, ie) <- genR e; pure (ie <> [IReturn (Just (T t))])

-- Espressioni; ritorna (temp, istruzioni)
genR :: A.Positioned A.RExpr -> M (Temp, [Instr])
genR e = case A.value e of
  A.IntConst i -> do t <- freshT; pure (t, [ICopy t (CInt i)])
  A.FloatConst d -> do t <- freshT; pure (t, [ICopy t (CFloat d)])
  A.BoolConst b -> do t <- freshT; pure (t, [ICopy t (CBool b)])
  A.Var (A.Id x) -> do t <- freshT; pure (t, [ICopy t (Var (identName x))])
  A.Bin op a b -> do
    (ta, ia) <- genR a; (tb, ib) <- genR b
    t <- freshT
    pure (t, ia <> ib <> [IBin t (toOp op) (T ta) (T tb)])
  A.Call fid args -> do
    -- scegli un ordine fisso (es. sinistra→destra) e motivarlo in relazione
    (temps, codes) <- fmap unzip (mapM genR args)
    let n = length temps
        pp = concatMap (\t -> [IParam (T t)]) temps
    t <- freshT
    pure (t, concat codes <> pp <> [ICall t (identName fid) n])
  -- altri casi: unari, array index, puntatori …
  _ -> do t <- freshT; pure (t, [])  -- placeholder

-- Short-circuit: costruisci direttamente i salti senza materializzare true/false
genBool :: A.Positioned A.RExpr -> Label -> Label -> M (Temp, [Instr])
genBool e lTrue lFalse = case A.value e of
  A.Bin A.And a b -> do
    lMid <- freshL "sc_and_"
    (_, ia) <- genBool a lMid lFalse
    (_, ib) <- genBool b lTrue lFalse
    pure ("", ia <> [ILabel lMid] <> ib)
  A.Bin A.Or a b -> do
    lMid <- freshL "sc_or_"
    (_, ia) <- genBool a lTrue lMid
    (_, ib) <- genBool b lTrue lFalse
    pure ("", ia <> [ILabel lMid] <> ib)
  _ -> do
    (t, ie) <- genR e
    pure (t, ie <> [IIfTrue (T t) lTrue, IGoto lFalse])

-- Helpers (adatta ai tuoi tipi)
identName :: A.Positioned A.Ident -> String
identName pid = case A.value pid of A.Ident s -> s

toTempVar :: A.Positioned A.Ident -> Temp
toTempVar x = identName x  -- se vuoi, genera sempre temp e poi copia su Var

toOp :: A.BOp -> Op
toOp = \case
  A.Plus->Add; A.Minus->Sub; A.Times->Mul; A.Div->Div; A.Mod->Mod
  A.Lt->Lt; A.Le->Le; A.Gt->Gt; A.Ge->Ge; A.Eq->Eq; A.Neq->Neq
  A.And->And; A.Or->Or
