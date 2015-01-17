module Ringo.Parser where
import Text.Parsec
import Text.Parsec.String
import Ringo.SKICore
--
--
--import Data.Functor ((<$>))
--import Ringo.Base
--
--s, k, i, b :: Expr
--s = L (L (L (A (A (V 2) (V 0)) (A (V 1) (V 0)))))
--k = L (L (V 1))
--i = L (V 0)
--b = L (L (L (A (A (V 2) (V 1)) (V 0))))
--
--pExpr, pTerm :: Parser Expr
--pExpr = foldl1 A <$> many1 pTerm
--pTerm = ((try $ string "hhs")  >> return s) <|>
--        ((try $ string "hbhb") >> return k) <|>
--        ((try $ string "hbh")  >> return i) <|>
--        (string "ybh" >> pTerm >> pTerm)   <|>
--        ((char '1') >> return b)
--
--rParse = parse pExpr
--

--rParse :: Parser Ex
--sParser = 

bass :: Parser String
bass  = (try $ (string "hb")) <|> (try $ (string "bh"))

snare :: Parser String
snare = (try $ (string "hs")) <|> (try $ (string "sh"))

hihat :: Parser Char
hihat = (try $ (char 'h'))

rParser :: Parser Expr
rParser = sParser <|> kParser <|> iParser

  where sParser = (try $ snare >> snare >> snare >> hihat >> return S)
        kParser = (try $ bass >> bass >> snare >> hihat >> return K)
        iParser = (try $ bass >> hihat >> snare >> hihat >> return I)

eval :: String -> String
eval input = case ret of
                 Left  e -> "Error: " ++ (show e)
                 Right v -> show v

             where
               ret = parse rParser "" input

