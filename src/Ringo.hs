module Ringo where
import Text.Parsec
import Text.Parsec.String
import Ringo.SKICore

rParser :: Parser Expr
rParser = do
  ((try $ string "hhs")  >> return S) <|> ((try $ string "hbhb") >> return K) <|> ((try $ string "hbh")  >> return I) 

eval :: String -> String
eval input = case ret of
                 Left  e -> "Error: " ++ (show e)
                 Right v -> show v

             where
               ret = parse rParser "" input

-- main :: IO()
-- main = do
--   [path] <- getArgs
--   code <- filter (not.isSpace) <$> readFile path
--   input <- getContents
--   putStr $ eval code input
