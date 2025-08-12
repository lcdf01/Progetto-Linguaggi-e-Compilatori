-- File: Main.hs
-- Main program per il progetto di Linguaggi e Compilatori
-- CORRETTO: Gestisce correttamente la lista di errori di tipo.

module Main where

import System.Environment (getArgs)
import System.IO (readFile)
import Grammatica.Par (pProgram, myLexer)
import Grammatica.Abs (Program)
import TypeChecker (typeCheckProgram)
import TypeEnv (prettyPrintError, TypeError) -- Importa anche il tipo TypeError

import Control.Monad (when)
import System.Exit (exitFailure)

import Grammatica.TacGen  (genProgram)
import Grammatica.TacPP   (ppProgram)

main :: IO ()
main = do
    args <- getArgs
    contents <- case args of
        [] -> getContents
        (filename:_) -> readFile filename

    case pProgram (myLexer contents) of
        Left err -> do
            putStrLn "Errore di parsing:"
            putStrLn err
            exitFailure
        Right ast -> do
            putStrLn "Parsing OK. Avvio type checking..."
            case typeCheckProgram ast of
                -- 'typeErrs' è una LISTA di errori
                Left typeErrs -> do
                    putStrLn "\n--- ERRORE/I DI TIPO RILEVATO/I ---\n"
                    -- --- MODIFICA CHIAVE ---
                    -- Itera sulla lista e stampa ogni errore formattato.
                    mapM_ (putStrLn . ("  - " ++) . prettyPrintError) typeErrs
                    putStrLn "\n------------------------------------"
                    exitFailure
                Right _ -> do
                    putStrLn "Type checking completato con successo."
                    putStrLn "Generazione TAC..."
                    let tacProg = genProgram ast   -- usa l'AST già tipato o l'AST originale
                    putStrLn (ppProgram tacProg)
                    putStrLn "TAC generato con successo."

