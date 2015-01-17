module Ringo where
import Ringo.Parser (eval)
import Data.Functor ((<$>))
import System.Environment (getArgs)
import Data.Char (isSpace)

main :: IO()
main = do
  [path] <- getArgs
  code <- filter (not.isSpace) <$> readFile path
  putStr $ eval code
