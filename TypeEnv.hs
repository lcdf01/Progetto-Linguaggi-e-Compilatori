-- File: TypeEnv.hs
-- Ambiente di tipi e strutture dati di base.
-- CORRETTO: Aggiunti gli esportatori per i campi dei record 'varEnv' e 'varPos'.

--- MODIFICA: Aggiunta lista di esportazione esplicita per includere TypeCheck.
module TypeEnv (
    -- Tipi principali
    Type(..),
    VarInfo(..), -- Esportiamo il tipo e...
    FunInfo(..),
    TypeEnv(..), -- Esportiamo il tipo e...
    TypeError(..),

    -- Monade del Type Checker
    TypeCheck,

    -- Ambiente iniziale e funzioni di utilità
    initialEnv,
    extractData,
    extractPos,
    convertType,
    convertBasicType,
    convertCompoundType,

    -- Funzioni helper per i tipi
    isNumericType,
    isIntegerType,
    isBooleanType,
    isArrayType,
    isPointerType,
    getArrayBaseType,
    getPointerBaseType,

    -- Funzioni di pretty printing
    prettyPrintPos,
    prettyPrintType,
    prettyPrintError
) where

import qualified Data.Map as Map
import Grammatica.Abs -- Importiamo i tipi dell'AST, inclusi Positioned e SourcePos
--- MODIFICA: Aggiunta delle importazioni per State e ExceptT.
import Control.Monad.State
import Control.Monad.Except
import Data.IntMap.Strict (size)
import Data.List (intercalate) -- Aggiunto per 'intercalateTypes'


-- | Rappresentazione dei tipi nel nostro sistema
data Type
    = TInt
    | TBool
    | TFloat
    | TChar
    | TString
    | TArray Int Type        -- Array di dimensione fissa
    | TArrayUndef Type       -- Array di dimensione indefinita
    | TPointer Type          -- Puntatore a tipo
    | TVoid                  -- Tipo void per procedure
    | TFunction [Type] Type  -- Tipo funzione: parametri -> ritorno
    | TError                 -- Tipo speciale per gestire errori di tipo
    deriving (Eq, Ord, Show)

-- | Informazioni su una variabile nell'ambiente
data VarInfo = VarInfo
    { varType    :: Type
    , varPos     :: SourcePos
    , varIsParam :: Bool
    , varIsInit  :: Bool
    } deriving (Eq, Show)

-- | Informazioni su una funzione nell'ambiente
data FunInfo = FunInfo
    { funRetType    :: Type
    , funPos        :: SourcePos
    , funParams     :: [Type]
    , funParamNames :: [String]
    } deriving (Eq, Show)

-- | Ambiente di tipo con scope annidati
data TypeEnv = TypeEnv
    { varEnv      :: [Map.Map String VarInfo]  -- Stack di scope per variabili
    , funEnv      :: Map.Map String FunInfo    -- Ambiente globale per funzioni
    , currentPos  :: SourcePos                 -- Posizione corrente (SourcePos)
    , inLoop      :: Bool
    } deriving (Show)

-- | Errori di tipo con informazioni di posizione
data TypeError
    = UndeclaredVariable String SourcePos
    | UndeclaredFunction String SourcePos
    | RedeclaredVariable String SourcePos SourcePos  -- nome, nuova pos, vecchia pos
    | RedeclaredFunction String SourcePos SourcePos
    | TypeMismatch Type Type SourcePos String  -- expected, actual, pos, context
    | InvalidOperation String Type SourcePos
    | InvalidArrayAccess Type SourcePos
    | InvalidPointerOp String Type SourcePos
    | InvalidAssignment Type Type SourcePos    -- lvalue type, rvalue type, pos
    | FunctionCallError String [Type] [Type] SourcePos  -- fun name, expected, actual, pos
    | NotLValue SourcePos
    | VoidValueUsed SourcePos
    | ArraySizeMismatch Int Int SourcePos      -- expected, actual, pos
    | BreakOutsideLoop SourcePos
    | ContinueOutsideLoop SourcePos
    | InvalidArrayLiteral Type [Type] SourcePos -- expected element type, actual types, pos
    | NegativeArraySize Integer SourcePos
    deriving (Eq, Show)

--- MODIFICA: Definizione della monade del Type Checker.
-- Combina la gestione dello stato (TypeEnv) e degli errori (TypeError).
type TypeCheck a = ExceptT [TypeError] (State TypeEnv) a

-- | Ambiente iniziale con funzioni predefinite
initialEnv :: TypeEnv
initialEnv = TypeEnv
    { varEnv = [Map.empty]
    , funEnv = Map.fromList predefinedFunctions
    , currentPos = SourcePos 0 0 ""
    , inLoop = False
    }
  where
    predefinedFunctions =
        [ ("writeInt", FunInfo TVoid (SourcePos 0 0 "builtin") [TInt] ["x"])
        , ("writeFloat", FunInfo TVoid (SourcePos 0 0 "builtin") [TFloat] ["x"])
        , ("writeChar", FunInfo TVoid (SourcePos 0 0 "builtin") [TChar] ["x"])
        , ("writeString", FunInfo TVoid (SourcePos 0 0 "builtin") [TString] ["x"])
        , ("readInt", FunInfo TInt (SourcePos 0 0 "builtin") [] [])
        , ("readFloat", FunInfo TFloat (SourcePos 0 0 "builtin") [] [])
        , ("readChar", FunInfo TChar (SourcePos 0 0 "builtin") [] [])
        , ("readString", FunInfo TString (SourcePos 0 0 "builtin") [] [])
        ]

-- | Funzioni di utilità per estrarre dati dall'AST
extractData :: Positioned a -> a
extractData (Positioned _ d) = d

extractPos :: Positioned a -> SourcePos
extractPos (Positioned p _) = p

-- | Conversione da TypeSpec dell'AST a Type interno
convertType :: Positioned TypeSpec -> Type
convertType (Positioned _ (BasTyp (Positioned _ bt))) = convertBasicType bt
convertType (Positioned _ (CompType (Positioned _ ct))) = convertCompoundType ct

convertBasicType :: BasicType -> Type
convertBasicType BasicType_int = TInt
convertBasicType BasicType_bool = TBool
convertBasicType BasicType_float = TFloat
convertBasicType BasicType_char = TChar
convertBasicType BasicType_string = TString

convertCompoundType :: CompoundType -> Type
convertCompoundType (ArrDef size tspec) = TArray (fromIntegral (extractData size)) (convertType tspec)
convertCompoundType (ArrUnDef tspec) = TArrayUndef (convertType tspec)
convertCompoundType (Pointer tspec) = TPointer (convertType tspec)

-- | Funzioni di utilità per i tipi
isNumericType :: Type -> Bool
isNumericType TInt = True
isNumericType TFloat = True
isNumericType TChar = True
isNumericType _ = False

isIntegerType :: Type -> Bool
isIntegerType TInt = True
isIntegerType TChar = True
isIntegerType _ = False

isBooleanType :: Type -> Bool
isBooleanType TBool = True
isBooleanType _ = False

isArrayType :: Type -> Bool
isArrayType (TArray _ _) = True
isArrayType (TArrayUndef _) = True
isArrayType _ = False

isPointerType :: Type -> Bool
isPointerType (TPointer _) = True
isPointerType _ = False

getArrayBaseType :: Type -> Maybe Type
getArrayBaseType (TArray _ t) = Just t
getArrayBaseType (TArrayUndef t) = Just t
getArrayBaseType _ = Nothing

getPointerBaseType :: Type -> Maybe Type
getPointerBaseType (TPointer t) = Just t
getPointerBaseType _ = Nothing

-- | Pretty printing
prettyPrintPos :: SourcePos -> String
prettyPrintPos (SourcePos l c f) =
    if null f || f == "builtin"
        then "line " ++ show l ++ ", column " ++ show c
        else f ++ ":" ++ show l ++ ":" ++ show c

prettyPrintType :: Type -> String
prettyPrintType TInt = "int"
prettyPrintType TBool = "bool"
prettyPrintType TFloat = "float"
prettyPrintType TChar = "char"
prettyPrintType TString = "string"
prettyPrintType TVoid = "void"
prettyPrintType TError = "TYPE_ERROR"
prettyPrintType (TArray size t) = "array(" ++ show size ++ ", " ++ prettyPrintType t ++ ")"
prettyPrintType (TArrayUndef t) = "array(_, " ++ prettyPrintType t ++ ")"
prettyPrintType (TPointer t) = "pointer to " ++ prettyPrintType t
prettyPrintType (TFunction params ret) =
    "func(" ++ intercalateTypes params ++ ") -> " ++ prettyPrintType ret
  where
    intercalateTypes [] = ""
    intercalateTypes [t] = prettyPrintType t
    intercalateTypes (t:ts) = prettyPrintType t ++ ", " ++ intercalateTypes ts

prettyPrintError :: TypeError -> String
prettyPrintError (UndeclaredVariable name pos) =
    prettyPrintPos pos ++ ": Undeclared variable '" ++ name ++ "'"
prettyPrintError (UndeclaredFunction name pos) =
    prettyPrintPos pos ++ ": Undeclared function '" ++ name ++ "'"
prettyPrintError (RedeclaredVariable name newPos oldPos) =
    prettyPrintPos newPos ++ ": Variable '" ++ name ++ "' already declared at " ++ prettyPrintPos oldPos
prettyPrintError (RedeclaredFunction name newPos oldPos) =
    prettyPrintPos newPos ++ ": Function '" ++ name ++ "' already declared at " ++ prettyPrintPos oldPos
prettyPrintError (TypeMismatch expected actual pos context) =
    prettyPrintPos pos ++ ": Type mismatch in " ++ context ++ ": expected " ++ prettyPrintType expected ++ ", but got " ++ prettyPrintType actual
prettyPrintError (InvalidOperation op typ pos) =
    prettyPrintPos pos ++ ": Invalid operation '" ++ op ++ "' for type " ++ prettyPrintType typ
prettyPrintError (InvalidArrayAccess typ pos) =
    prettyPrintPos pos ++ ": Cannot access element of non-array type: " ++ prettyPrintType typ
prettyPrintError (InvalidPointerOp op typ pos) =
    prettyPrintPos pos ++ ": Invalid pointer operation '" ++ op ++ "' on type: " ++ prettyPrintType typ
prettyPrintError (InvalidAssignment ltype rtype pos) =
    prettyPrintPos pos ++ ": Cannot assign value of type " ++ prettyPrintType rtype ++ " to a variable of type " ++ prettyPrintType ltype
prettyPrintError (FunctionCallError name expected actual pos) =
    prettyPrintPos pos ++ ": Function '" ++ name ++ "' expects arguments of type (" ++ intercalateTypes expected ++ ") but got (" ++ intercalateTypes actual ++ ")"
  where
    intercalateTypes [] = ""
    intercalateTypes [t] = prettyPrintType t
    intercalateTypes (t:ts) = prettyPrintType t ++ ", " ++ intercalateTypes ts
prettyPrintError (NotLValue pos) =
    prettyPrintPos pos ++ ": Expression is not a valid l-value (cannot be assigned to)"
prettyPrintError (VoidValueUsed pos) =
    prettyPrintPos pos ++ ": Cannot use a void value in an expression"
prettyPrintError (ArraySizeMismatch expected actual pos) =
    prettyPrintPos pos ++ ": Array literal size mismatch: expected " ++ show expected ++ " elements, but got " ++ show actual
prettyPrintError (BreakOutsideLoop pos) =
    prettyPrintPos pos ++ ": 'break' statement is not inside a loop"
prettyPrintError (ContinueOutsideLoop pos) =
    prettyPrintPos pos ++ ": 'continue' statement is not inside a loop"
prettyPrintError (InvalidArrayLiteral expectedType actualTypes pos) =
    prettyPrintPos pos ++ ": Array literal elements must all be compatible with type " ++ prettyPrintType expectedType ++ ", but found types: " ++ intercalateTypes actualTypes
  where
    intercalateTypes [] = ""
    intercalateTypes [t] = prettyPrintType t
    intercalateTypes (t:ts) = prettyPrintType t ++ ", " ++ intercalateTypes ts
prettyPrintError (NegativeArraySize size pos) =
    prettyPrintPos pos ++ ": Array size cannot be negative: " ++ show size