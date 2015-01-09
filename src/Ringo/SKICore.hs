module Ringo.SKICore where
infixl 9 :$>
data Expr = Expr :$> Expr | S | K | I deriving(Show, Eq)   

($>) :: Expr -> Expr -> Expr
S :$> x :$> y $> z = (x $> z) $> (y $> z)
K :$> x $> y       = x
I $> x             = x
f $> x             = f :$> x
