module Main where

main :: IO ()
main = repl

repl :: IO ()
repl = do putStr "$ "
          line <- getLine
          putStrLn (ringoParser line)
          repl

ringoParser line = line
