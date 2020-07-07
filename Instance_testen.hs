data StringOrInt = TisanInt Int | TisAString String

instance Eq (StringOrInt) where 
  (==) (TisanInt v) (TisanInt v') = v == v'
  (==) (TisAString s) (TisAString s') = s == s'

data Pair a = Pair a a

instance Eq a => Eq (Pair a) where
  (==) (Pair a j) (Pair a' j')= a==a' && j==j'

data Tuple a b = Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple a b) (Tuple a' b')= a==a'&& b==b'

data Which a = ThisOne a | ThatOne a

instance Eq a => Eq (Which a) where
  (==) (ThisOne a) (ThisOne a')= a==a'
  (==) (ThatOne b) (ThatOne b')= b==b'

data EitherOr a b = Hello a | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello a) (Hello a') = a == a'
  (==) (Goodbye b) (Goodbye b') = b == b' 
