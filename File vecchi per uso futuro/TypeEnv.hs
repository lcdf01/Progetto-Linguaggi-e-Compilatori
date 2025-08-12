-- File: TypeEnv.hs
-- Ambiente di tipi e strutture dati di base
-- A.A. 2024-25 - Progetto Linguaggi e Compilatori

module TypeEnv where

import qualified Data.Map as Map
import Grammatica.Abs
import qualified Grammatica.Abs as Abs

-- | Informazioni di posizione per localizzazione errori nel sorgente
data Loc = Loc
    { locLine :: Int      -- Linea nel sorgente
    , locCol :: Int       -- Colonna nel sorgente  
    , locFile :: String   -- Nome del file (opzionale)
    } deriving (Eq, Ord, Show)

-- | Tipo di dato per informazioni con posizione (Lock)
data Lock a = Lock
    { lockData :: a       -- Il dato vero e proprio
    , lockLoc :: Loc      -- Informazioni di posizione
    } deriving (Eq, Show, Functor)

-- | Crea un Lock con posizione di default
mkLock :: a -> Lock a
mkLock x = Lock x (Loc 0 0 "")

-- | Crea un Lock con posizione specifica
mkLockAt :: Int -> Int -> String -> a -> Lock a
mkLockAt line col file x = Lock x (Loc line col file)

-- | Estrae il dato da un Lock
unlockData :: Lock a -> a
unlockData (Lock x _) = x

-- | Estrae la posizione da un Lock
unlockLoc :: Lock a -> Loc
unlockLoc (Lock _ loc) = loc

-- | Rappresentazione dei tipi nel sistema
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
    deriving (Eq, Ord, Show)

-- | Informazioni su una variabile nell'ambiente
data VarInfo = VarInfo
    { varType :: Type        -- Tipo della variabile
    , varLoc :: Loc          -- Posizione di dichiarazione
    , varIsParam :: Bool     -- True se è un parametro di funzione
    , varIsInit :: Bool      -- True se è stata inizializzata
    } deriving (Eq, Show)

-- | Informazioni su una funzione nell'ambiente  
data FunInfo = FunInfo
    { funType :: Type        -- Tipo della funzione
    , funLoc :: Loc          -- Posizione di dichiarazione
    , funParams :: [Type]    -- Tipi dei parametri
    , funParamNames :: [String]  -- Nomi dei parametri
    } deriving (Eq, Show)

-- | Ambiente di tipo con scope annidati
data TypeEnv = TypeEnv
    { varEnv :: [Map.Map String VarInfo]  -- Stack di scope per variabili
    , funEnv :: Map.Map String FunInfo    -- Ambiente globale per funzioni
    , currentLoc :: Loc                   -- Posizione corrente
    , inLoop :: Bool                      -- True se siamo dentro un ciclo
    , loopDepth :: Int                    -- Profondità di annidamento cicli
    } deriving (Show)

-- | Errori di tipo con informazioni di posizione
data TypeError 
    = UndeclaredVariable String Loc
    | UndeclaredFunction String Loc  
    | RedeclaredVariable String Loc Loc  -- nome, nuova pos, vecchia pos
    | RedeclaredFunction String Loc Loc
    | TypeMismatch Type Type Loc String  -- expected, actual, pos, context
    | InvalidOperation String Type Loc
    | InvalidArrayAccess Type Loc
    | InvalidPointerOp Type Loc
    | InvalidAssignment Type Type Loc    -- lvalue type, rvalue type, pos
    | FunctionCallError String [Type] [Type] Loc  -- fun name, expected, actual, pos
    | NotLValue String Loc
    | VoidValueUsed Loc
    | ArraySizeMismatch Int Int Loc      -- expected, actual, pos
    | BreakOutsideLoop Loc
    | ContinueOutsideLoop Loc
    | InvalidArrayLiteral Type [Type] Loc -- expected element type, actual types, pos
    | DivisionByZero Loc
    | NegativeArraySize Int Loc
    deriving (Eq, Show)

-- | Ambiente iniziale con funzioni predefinite
initialEnv :: TypeEnv
initialEnv = TypeEnv
    { varEnv = [Map.empty]
    , funEnv = Map.fromList predefinedFunctions
    , currentLoc = Loc 1 1 ""
    , inLoop = False
    , loopDepth = 0
    }
  where
    predefinedFunctions = 
        [ ("writeInt", FunInfo (TFunction [TInt] TVoid) (Loc 0 0 "builtin") [TInt] ["x"])
        , ("writeFloat", FunInfo (TFunction [TFloat] TVoid) (Loc 0 0 "builtin") [TFloat] ["x"])
        , ("writeChar", FunInfo (TFunction [TChar] TVoid) (Loc 0 0 "builtin") [TChar] ["x"])
        , ("writeString", FunInfo (TFunction [TString] TVoid) (Loc 0 0 "builtin") [TString] ["x"])
        , ("readInt", FunInfo (TFunction [] TInt) (Loc 0 0 "builtin") [] [])
        , ("readFloat", FunInfo (TFunction [] TFloat) (Loc 0 0 "builtin") [] [])
        , ("readChar", FunInfo (TFunction [] TChar) (Loc 0 0 "builtin") [] [])
        , ("readString", FunInfo (TFunction [] TString) (Loc 0 0 "builtin") [] [])
        ]

-- | Conversione da TypeSpec dell'AST a Type interno
convertType :: TypeSpec -> Type
convertType (BasTyp bt) = convertBasicType bt
convertType (CompType ct) = convertCompoundType ct

convertBasicType :: BasicType -> Type
convertBasicType BasicType_int = TInt
convertBasicType BasicType_bool = TBool
convertBasicType BasicType_float = TFloat
convertBasicType BasicType_char = TChar
convertBasicType BasicType_string = TString

convertCompoundType :: CompoundType -> Type
convertCompoundType (ArrDef size typeSpec) = TArray (fromIntegral size) (convertType typeSpec)
convertCompoundType (ArrUnDef typeSpec) = TArrayUndef (convertType typeSpec)
convertCompoundType (Pointer typeSpec) = TPointer (convertType typeSpec)

-- | Funzioni di utilità per i tipi

-- | Verifica se un tipo è numerico
isNumericType :: Type -> Bool
isNumericType TInt = True
isNumericType TFloat = True
isNumericType TChar = True
isNumericType _ = False

-- | Verifica se un tipo è intero
isIntegerType :: Type -> Bool
isIntegerType TInt = True
isIntegerType TChar = True
isIntegerType _ = False

-- | Verifica se un tipo è booleano
isBooleanType :: Type -> Bool
isBooleanType TBool = True
isBooleanType _ = False

-- | Verifica se un tipo è un array
isArrayType :: Type -> Bool
isArrayType (TArray _ _) = True
isArrayType (TArrayUndef _) = True
isArrayType _ = False

-- | Verifica se un tipo è un puntatore
isPointerType :: Type -> Bool
isPointerType (TPointer _) = True
isPointerType _ = False

-- | Ottiene il tipo base di un array
getArrayBaseType :: Type -> Maybe Type
getArrayBaseType (TArray _ t) = Just t
getArrayBaseType (TArrayUndef t) = Just t
getArrayBaseType _ = Nothing

-- | Ottiene la dimensione di un array (se definita)
getArraySize :: Type -> Maybe Int
getArraySize (TArray size _) = Just size
getArraySize _ = Nothing

-- | Ottiene il tipo puntato da un puntatore
getPointerBaseType :: Type -> Maybe Type
getPointerBaseType (TPointer t) = Just t
getPointerBaseType _ = Nothing

-- | Pretty printing dei tipi
prettyPrintType :: Type -> String
prettyPrintType TInt = "int"
prettyPrintType TBool = "bool"
prettyPrintType TFloat = "float"
prettyPrintType TChar = "char"
prettyPrintType TString = "string"
prettyPrintType TVoid = "void"
prettyPrintType (TArray size t) = "[" ++ show size ++ "]" ++ prettyPrintType t
prettyPrintType (TArrayUndef t) = "[]" ++ prettyPrintType t
prettyPrintType (TPointer t) = "*" ++ prettyPrintType t
prettyPrintType (TFunction params ret) = 
    "func(" ++ intercalateTypes params ++ ") " ++ prettyPrintType ret
  where
    intercalateTypes [] = ""
    intercalateTypes [t] = prettyPrintType t
    intercalateTypes (t:ts) = prettyPrintType t ++ ", " ++ intercalateTypes ts

-- | Pretty printing delle posizioni
prettyPrintLoc :: Loc -> String
prettyPrintLoc (Loc line col file) = 
    if null file 
        then "line " ++ show line ++ ", column " ++ show col
        else file ++ ":" ++ show line ++ ":" ++ show col

-- | Pretty printing degli errori
prettyPrintError :: TypeError -> String
prettyPrintError (UndeclaredVariable name loc) =
    prettyPrintLoc loc ++ ": Undeclared variable '" ++ name ++ "'"
prettyPrintError (UndeclaredFunction name loc) =
    prettyPrintLoc loc ++ ": Undeclared function '" ++ name ++ "'"
prettyPrintError (RedeclaredVariable name newLoc oldLoc) =
    prettyPrintLoc newLoc ++ ": Variable '" ++ name ++ 
    "' already declared at " ++ prettyPrintLoc oldLoc
prettyPrintError (RedeclaredFunction name newLoc oldLoc) =
    prettyPrintLoc newLoc ++ ": Function '" ++ name ++ 
    "' already declared at " ++ prettyPrintLoc oldLoc
prettyPrintError (TypeMismatch expected actual loc context) =
    prettyPrintLoc loc ++ ": Type mismatch in " ++ context ++ 
    ": expected " ++ prettyPrintType expected ++ 
    ", got " ++ prettyPrintType actual
prettyPrintError (InvalidOperation op typ loc) =
    prettyPrintLoc loc ++ ": Invalid operation '" ++ op ++ 
    "' for type " ++ prettyPrintType typ
prettyPrintError (InvalidArrayAccess typ loc) =
    prettyPrintLoc loc ++ ": Cannot access array element of non-array type " ++ 
    prettyPrintType typ
prettyPrintError (InvalidPointerOp typ loc) =
    prettyPrintLoc loc ++ ": Invalid pointer operation on type " ++ 
    prettyPrintType typ
prettyPrintError (InvalidAssignment ltype rtype loc) =
    prettyPrintLoc loc ++ ": Cannot assign " ++ prettyPrintType rtype ++ 
    " to " ++ prettyPrintType ltype
prettyPrintError (FunctionCallError name expected actual loc) =
    prettyPrintLoc loc ++ ": Function '" ++ name ++ "' expects (" ++ 
    intercalateTypes expected ++ ") but got (" ++ intercalateTypes actual ++ ")"
  where
    intercalateTypes [] = ""
    intercalateTypes [t] = prettyPrintType t
    intercalateTypes (t:ts) = prettyPrintType t ++ ", " ++ intercalateTypes ts
prettyPrintError (NotLValue expr loc) =
    prettyPrintLoc loc ++ ": Expression is not a valid lvalue: " ++ expr
prettyPrintError (VoidValueUsed loc) =
    prettyPrintLoc loc ++ ": Cannot use void value in expression"
prettyPrintError (ArraySizeMismatch expected actual loc) =
    prettyPrintLoc loc ++ ": Array size mismatch: expected " ++ 
    show expected ++ ", got " ++ show actual
prettyPrintError (BreakOutsideLoop loc) =
    prettyPrintLoc loc ++ ": 'break' statement not in loop"
prettyPrintError (ContinueOutsideLoop loc) =
    prettyPrintLoc loc ++ ": 'continue' statement not in loop"
prettyPrintError (InvalidArrayLiteral expectedType actualTypes loc) =
    prettyPrintLoc loc ++ ": Array literal elements must be of type " ++ 
    prettyPrintType expectedType ++ ", but found: " ++ 
    intercalateTypes actualTypes
  where
    intercalateTypes [] = ""
    intercalateTypes [t] = prettyPrintType t
    intercalateTypes (t:ts) = prettyPrintType t ++ ", " ++ intercalateTypes ts
prettyPrintError (DivisionByZero loc) =
    prettyPrintLoc loc ++ ": Division by zero"
prettyPrintError (NegativeArraySize size loc) =
    prettyPrintLoc loc ++ ": Array size cannot be negative: " ++ show size