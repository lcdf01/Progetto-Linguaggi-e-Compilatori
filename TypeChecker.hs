-- File: TypeChecker.hs
-- Punto di ingresso principale per il type checker.
-- Questo modulo delega tutta la logica di controllo al modulo TypeRules.

module TypeChecker (typeCheckProgram) where -- Esporta solo la funzione principale

import TypeEnv
-- MODIFICA: Aggiunta la clausola 'hiding' per risolvere l'ambiguità
import TypeRules hiding (typeCheckProgram)
import qualified TypeRules as TR -- Usiamo un alias per chiarezza
import Grammatica.Abs

-- | Funzione principale per il type checking di un programma.
-- Ritorna una lista di errori o l'ambiente finale se ha successo.
-- Questa funzione ora è solo un wrapper attorno alla funzione omonima
-- definita in TypeRules, per mantenere la compatibilità se altri moduli
-- dipendono da questo.
typeCheckProgram :: Positioned Program -> Either [TypeError] TypeEnv
typeCheckProgram = TR.typeCheckProgram -- Chiama la versione da TypeRules usando l'alias