module Ringo.Parser where
import Data.Functor ((<$>))
import Text.Parsec
import Text.Parsec.String

import Ringo.Base

s, k, i, b :: Expr
s = L (L (L (A (A (V 2) (V 0)) (A (V 1) (V 0)))))
k = L (L (V 1))
i = L (V 0)
b = L (L (L (A (A (V 2) (V 1)) (V 0))))

pExpr, pTerm :: Parser Expr
pExpr = foldl1 A <$> many1 pTerm
pTerm = ((try $ string "hhs")  >> return s) <|>
        ((try $ string "hbhb") >> return k) <|>
        ((try $ string "hbh")  >> return i) <|>
        (string "ybh" >> pTerm >> pTerm)   <|>
        ((char '1') >> return b)

rParse = parse pExpr
