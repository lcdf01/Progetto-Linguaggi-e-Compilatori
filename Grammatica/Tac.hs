module Grammatica.Tac where

type Temp = String
type Label = String

data Op = Add | Sub | Mul | Div | Mod | Lt | Le | Gt | Ge | Eq | Neq | And | Or
  deriving (Eq, Show)

data UnOp = Neg | Not | FtoI | ItoF
  deriving (Eq, Show)

-- Un "operand" può essere un temporaneo, una costante, o un nome di var.
data Opr = T Temp | CInt Integer | CFloat Double | CBool Bool | CChar Char | CString String | Var String
  deriving (Eq, Show)

data Instr
  = ILabel Label
  | IGoto Label
  | IIfTrue Opr Label
  | IIfFalse Opr Label
  | IBin Temp Op Opr Opr        -- t = a op b
  | IUn  Temp UnOp Opr          -- t = op a
  | ICopy Temp Opr              -- t = a
  | ILoad Temp Opr Opr          -- t = a[b]   (array/puntatore)
  | IStore Opr  Opr Opr         -- a[b] = c
  | IAddr Temp Opr              -- t = &a
  | ILoadPtr Temp Opr           -- t = *p
  | IStorePtr Opr  Opr          -- *p = a
  | IParam Opr                  -- push param
  | ICall Temp String Int       -- t = call f, n params
  | ICallVoid String Int
  | IReturn (Maybe Opr)
  deriving (Eq, Show)

newtype Program = Program [Instr] deriving (Eq, Show)
