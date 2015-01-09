module Ringo.Coder where
import Ringo.Base

s2e :: String -> Expr -- input
s2e [] = nil
s2e (c:cs) = A (A cons $ i2e $ fromEnum c) $ s2e cs
  where i2e 0 = zero
        i2e n = A suc $ i2e $ n - 1

e2s :: Expr -> String -- output
e2s e | e == nil = ""
      | otherwise = (toEnum $ e2s' $ step $ (A car e)) : (e2s $ step $ A cdr e)
        where e2s' (L (L (V _))) = 0
              e2s' (L (L e)) = f e 0
              e2s' _ = 0
f (A _ n) x = f n (x + 1)
f _ x = x
