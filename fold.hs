import Data.Time
--C:\Users\achen\Desktop\Haskell\fold.hs
--- :set prompt  "\x03BB> "

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
                  deriving  (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
    [ DbDate (UTCTime
             (fromGregorian 1911 5 1)
             (secondsToDiffTime 34250))
    , DbNumber 9001
    , DbString "Hello, world!"
    , DbDate (UTCTime
             (fromGregorian 1921 5 1)
             (secondsToDiffTime 34123))
    ]

--filterDbDate :: [DatabaseItem] -> [UTCTime]
--filterDbDate x = head x

reverse' :: [a] -> [a]
reverse' x = foldl (flip (:)) [] x

length':: (Foldable t, Num b) => t b -> b
length' x = foldl (\_ y -> y + 1) 0 x

--onlyThree :: Integral a => [a] -> [a]
--onlyThree z= filter (\x -> mod x 3 == 0) z

fibs :: [Integer]
fibs = 1 : scanl (+) 1 fibs

fibsTwenty :: [Integer]
fibsTwenty = take 20 $ 1 : scanl (+) 1 fibs

fibsLessHunderd :: [Integer]
fibsLessHunderd = filter (< 100) $ take 300 $ 1 : scanl (+) 1 fibs

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)

--factorial' :: Int -> Integer
--factorial' n = factorials !! n
--    where
--        factorials :: [Integer]
--        factorials = scanl (*) 1 [1..]

factorials :: [Integer]
factorials = scanl (*) 1 [2..]

stops :: [Char]
stops = "pbtdkg"

vowels :: [Char]
vowels = "aeiou"

seekritFunc :: String -> Float
seekritFunc x =  fromIntegral (sum(map length (words x)))  / fromIntegral (length (words x))


-- if else
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) =
    if x == True
        then True
        else myOr xs

--recursive
myOr' :: [Bool] -> Bool
myOr' [] = False
myOr' (x:xs) = x || myOr' xs


--fold without point free notation
myOr'' :: [Bool] -> Bool
myOr'' = foldr (\a b -> if a == True then True else b) False

--fold with point free notation
myOr''' :: [Bool] -> Bool
myOr''' = foldr (||) False


--any function with if else
myAny :: (a-> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x:xs) = if f x == True then True else myAny f xs

--any function direct recusrion
myAny' :: (a-> Bool) -> [a] -> Bool
myAny' _ [] = False
myAny' f (x:xs)= f x == True || myAny' f xs

--any function foldr
myAny'' :: (a-> Bool) -> [a] -> Bool
myAny'' f = foldr (\a b -> f a || b) False

--any function point free

-- elem with if else statement
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem y (x:xs) = if y == x then True else myElem y xs

--elem with direct recursion
myElem' :: Eq a => a -> [a] -> Bool
myElem' _ [] = False
myElem' y (x:xs) = y == x || myElem' y xs


--elem with foldr
--myElem'' :: Eq a => a -> [a] -> Bool
--myElem'' = foldr (\a b -> )


--elem with any
myElemAny :: Eq a => a -> [a] -> Bool
myElemAny a = any (== a)

--elem with any
myElemAny' :: Eq a => a -> [a] -> Bool
myElemAny' a xs= any (== a) xs

--elem with fold
myElemFold :: Eq a => a -> [a] -> Bool
myElemFold y = foldr (\x b -> x == y || b) False

--myReverse
myReverse :: [a] -> [a]
myReverse [] = []
myReverse xs = last xs : myReverse (init xs)

myReverse' :: [a] -> [a]
myReverse' = foldl (flip (:)) []

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:).f) []

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\x xs -> if f x then x:xs else xs) []

squish :: [[a]] -> [a]
squish = foldr (++) []  

squishMap :: (a-> [b])-> [a]-> [b]
squishMap f = foldr ((++) . f) []

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id 


