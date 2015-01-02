module Main where
import Prelude hiding (putStr, putStrLn)
import Ringo

main :: IO ()
main = repl

repl :: IO ()
repl = do putStr "$ "
          line <- getLine
          putStrLn (ringoParser line)
          repl

