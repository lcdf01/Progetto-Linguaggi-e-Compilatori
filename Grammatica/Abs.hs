-- File generated by the BNF Converter (bnfc 2.9.5).

{-# LANGUAGE GeneralizedNewtypeDeriving #-}

-- | The abstract syntax of language Grammatica.

module Grammatica.Abs where

import Prelude (Char, Double, Integer, String)
import qualified Prelude as C (Eq, Ord, Show, Read)
import qualified Data.String

data Boolean = Boolean_true | Boolean_false
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data RExpr
    = Or RExpr RExpr
    | And RExpr RExpr
    | Not RExpr
    | Eq RExpr RExpr
    | Neq RExpr RExpr
    | Lt RExpr RExpr
    | LtE RExpr RExpr
    | Gt RExpr RExpr
    | GtE RExpr RExpr
    | Add RExpr RExpr
    | Sub RExpr RExpr
    | Mul RExpr RExpr
    | Div RExpr RExpr
    | Mod RExpr RExpr
    | Pow RExpr RExpr
    | Neg RExpr
    | Ref LExpr
    | FCall FunCall
    | Int Integer
    | Char Char
    | String String
    | Float Double
    | Bool Boolean
    | GoArrayLit Integer BasicType [RExpr]
    | Lexpr LExpr
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data FunCall = Call Ident [RExpr]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data LExpr
    = Deref RExpr
    | PreInc LExpr
    | PreDecr LExpr
    | PostInc LExpr
    | PostDecr LExpr
    | BasLExpr BLExpr
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data BLExpr = ArrayEl Ident RExpr | Id Ident
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Program = Prog [Decl]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Decl = Dfun Ident [Parameter] CompStmt | DvarGo VarSpec
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Parameter = Param Ident TypeSpec
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data VarSpec
    = VarSpecSingleInit Ident TypeSpec RExpr
    | VarSpecArrayInit Ident RExpr
    | VarSpecSingleNoInit Ident TypeSpec
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data TypeSpec = BasTyp BasicType | CompType CompoundType
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data BasicType
    = BasicType_bool
    | BasicType_char
    | BasicType_float
    | BasicType_int
    | BasicType_string
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data CompoundType
    = ArrDef Integer TypeSpec | ArrUnDef TypeSpec | Pointer TypeSpec
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data CompStmt = BlockDecl [BlockItem]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data BlockItem = DeclItem Decl | StmtItem Stmt
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Stmt
    = Comp CompStmt
    | ProcCall FunCall
    | Jmp JumpStmt
    | Iter IterStmt
    | Sel SelectionStmt
    | Assgn LExpr Assignment_op RExpr
    | LExprStmt LExpr
    | DeclStmt VarSpec
    | StmtInc Ident
    | StmtDec Ident
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Assignment_op
    = Assign
    | AssgnMul
    | AssgnAdd
    | AssgnDiv
    | AssgnSub
    | AssgnPow
    | AssgnAnd
    | AssgnOr
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data JumpStmt = Break | Continue
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data SelectionStmt = IfNoElse RExpr Stmt | IfElse RExpr Stmt Stmt
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data IterStmt = While RExpr Stmt | DoWhile Stmt RExpr
  deriving (C.Eq, C.Ord, C.Show, C.Read)

newtype Ident = Ident String
  deriving (C.Eq, C.Ord, C.Show, C.Read, Data.String.IsString)

