-- File: Main.hs
-- Main program per il progetto di Linguaggi e Compilatori

module Main where

import System.Environment (getArgs)
import System.IO (readFile)
import Grammatica.Par (pProgram, myLexer)
--import Grammatica.Lex (myLexer)
import Grammatica.Abs (Program)
import TypeChecker (typeCheckProgram)
import TypeEnv (prettyPrintError)

import Control.Monad (when)
import System.Exit (exitFailure)

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
                Left typeErr -> do
                    putStrLn "Type checking fallito:"
                    putStrLn $ prettyPrintError typeErr
                    exitFailure
                Right _ -> do
                    putStrLn "Type checking completato con successo."
