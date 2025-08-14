-- File: Grammatica/TacPP.hs
-- Modificato per stampare gli identificatori nel formato nome_linea.

{-# LANGUAGE LambdaCase #-}

module Grammatica.TacPP (ppProgram, tagIdent) where

import Grammatica.Tac
import qualified Grammatica.Abs as A -- Importa i tipi dell'AST
import qualified Data.List as L

ppProgram :: Program -> String
ppProgram (Program is) = unlines (map pp is)

pp :: Instr -> String
pp = \case
  ILabel l           -> l ++ ":"
  IGoto l            -> "goto " ++ l
  IIfTrue a l        -> "if " ++ po a ++ " goto " ++ l
  IIfFalse a l       -> "ifFalse " ++ po a ++ " goto " ++ l
  IBin t op a b      -> t ++ " = " ++ po a ++ " " ++ pop op ++ " " ++ po b
  IUn t u a          -> t ++ " = " ++ pou u ++ " " ++ po a
  ICopy t a          -> t ++ " = " ++ po a
  ILoad t a b        -> t ++ " = " ++ po a ++ "[" ++ po b ++ "]"
  IStore a b c       -> po a ++ "[" ++ po b ++ "] = " ++ po c
  IAddr t a          -> t ++ " = &" ++ po a
  ILoadPtr t p       -> t ++ " = *" ++ po p
  IStorePtr p a      -> "*" ++ po p ++ " = " ++ po a
  IParam a           -> "param " ++ po a
  ICall t f n        -> t ++ " = call " ++ f ++ ", " ++ show n
  ICallVoid f n      -> "call " ++ f ++ ", " ++ show n
  IReturn Nothing    -> "return"
  IReturn (Just a)   -> "return " ++ po a
 where
  pop = \case
    Add->"+"; Sub->"-"; Mul->"*"; Div->"/"; Mod->"%"
    Lt->"<"; Le->"<="; Gt->">"; Ge->">="; Eq->"=="; Neq->"!="
    And->"&&"; Or->"||"
  pou = \case Neg->"-"; Not->"!"; FtoI->"(i2i)"; ItoF->"(f2f)"
  po = \case
    T t        -> t
    -- *** MODIFICA CHIAVE ***
    -- Quando stampiamo una variabile, usiamo la funzione 'tagIdent'
    -- per aggiungere la posizione di dichiarazione, come da specifica.
    Var v pos  -> tagIdent (v, (A.line pos, A.column pos))
    CInt i     -> show i
    CFloat d   -> show d
    CBool b    -> if b then "true" else "false"
    CChar c    -> show c
    CString s  -> show s

-- Modificato per corrispondere all'esempio della specifica (es. "x_12")
tagIdent :: (String, (Int,Int)) -> String
tagIdent (name,(l,_)) = name ++ "_" ++ show l
