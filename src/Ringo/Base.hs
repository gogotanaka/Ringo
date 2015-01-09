module Ringo.Base where

data Expr = V Int | L Expr | A Expr Expr deriving Eq

zero = (L (L (V 0)))
suc = (L (L (L (A (V 1) (A (A (V 2) (V 1)) (V 0))))))
cons = (L (L (L (A (A (V 0) (V 2)) (V 1)))))
car = (L (A (V 0) (L (L (V 1)))))
cdr = (L (A (V 0) (L (L (V 0)))))
nil = (L (L (V 0)))


step :: Expr -> Expr
step (A f e) = step' (A (step f) e)
  where step' (A (L v) e) = step $ subst 0 v (step e)
        step' (A g e) = A g (step e)
step (L e) = L $ step e
step e = e


subst :: Int -> Expr -> Expr -> Expr
subst v (L w) e = L (subst (v + 1) w e)
subst v (A m n) e = A (subst v m e) (subst v n e)
subst v (V n) e | n < v = V n
                | n == v = subst' 0 v e
                | n > v = V (n - 1)
  where subst' t v (L w) = L (subst' (t + 1) v w)
        subst' t v (A m n) = A (subst' t v m) (subst' t v n)
        subst' t v (V n) | n < t = V n
                         | n >= t = V (n + v)
