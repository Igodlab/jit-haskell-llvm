module Main where

import Parser 

import Control.Monad.Trans
import System.Console.Haskeline

process :: String -> IO ()
process ln = do 
    let res = parseToplevel ln
    case res of 
        Left err -> print err 
        Right ex -> mapM_ print ex

main :: IO () 
main = runInputT defaultSettings loop
  where
    loop = do 
        minput <- getInputLine "ready> "
        case minput of
            Nothing    -> outputStrLn "Goodbye."
            Just input -> (liftIO $ process input) >> loop
