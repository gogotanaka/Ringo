module Main where
import Ringo.Parser (eval)
import System.IO (hFlush, stdout)

main :: IO ()
main = do welcomeMes
          repl

welcomeMes :: IO ()
welcomeMes = putStr "Welcome!\n"

repl :: IO ()
repl = do putStr "$ "
          hFlush stdout
          line <- getLine
          (putStrLn.eval) line
          repl
