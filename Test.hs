-- File: Test.hs
-- QUESTA È LA VERSIONE CORRETTA - PER FAVORE, USA QUESTA.

module Main where

import System.Environment (getArgs)
import System.IO (readFile)

import qualified Grammatica.Abs as A
import Grammatica.Par (pProgram, myLexer)

-- Importa i moduli del compilatore
import TypeChecker (typeCheckProgram)
import TypeEnv         -- Importa tutto da TypeEnv (incluso TypeEnv, prettyPrintError)
import Grammatica.TacGen  (genProgram)
import Grammatica.TacPP   (ppProgram)

import System.Exit (exitFailure)


main :: IO ()
main = do
    -- Legge il nome del file dall'argomento della linea di comando
    args <- getArgs
    contents <- case args of
        [] -> do
            putStrLn "Errore: Fornire il nome del file di test come argomento."
            exitFailure
        (filename:_) -> readFile filename

    -- 1. Parsing
    case pProgram (myLexer contents) of
        Left err -> do
            putStrLn "Errore di parsing:"
            putStrLn err
            exitFailure
        Right ast -> do
            putStrLn "Parsing OK. Avvio type checking..."
            
            -- 2. Type Checking
            case typeCheckProgram ast of
                Left typeErrs -> do
                    putStrLn "\n--- ERRORE/I DI TIPO RILEVATO/I ---\n"
                    mapM_ (putStrLn . ("  - " ++) . prettyPrintError) typeErrs
                    putStrLn "\n------------------------------------"
                    exitFailure
                
                -- Se il type checking ha successo, catturiamo l'ambiente finale ('finalEnv').
                Right finalEnv -> do
                    putStrLn "Type checking completato con successo."
                    putStrLn "Generazione TAC..."
                    
                    -- --- LA RIGA CHIAVE È QUESTA ---
                    -- Chiama 'genProgram' con ENTRAMBI i suoi argomenti:
                    -- l'AST spacchettato e l'ambiente dei tipi finale ('finalEnv').
                    -- 'tacProg' ora avrà correttamente tipo 'Program', non una funzione.
                    let tacProg = genProgram (A.value ast) finalEnv
                    
                    -- 3. Stampa del Three-Address Code
                    putStrLn "\n--- Three-Address Code ---\n"
                    -- Questa chiamata ora funzionerà perché 'tacProg' è del tipo giusto.
                    putStrLn (ppProgram tacProg)
                    putStrLn "\n--------------------------"
                    putStrLn "TAC generato con successo."