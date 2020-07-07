import Data.Char
import Data.List

safeHead :: [a] -> Maybe a
safeHead []    = Nothing
safeHead (x:_) = Just x

safeTail :: [a] -> Maybe [a]
safeTail []     = Nothing
safeTail (_:[]) = Nothing
safeTail (_:xs) = Just xs

enumFromTo' ::(Ord a, Enum a) => a -> a -> [a]
enumFromTo' x y =
    case x == y of
        True -> [x]
        False -> enumFromTo' x (pred y) ++ [y]


eftBool :: Bool -> Bool -> [Bool]
eftBool x y = [x,y]

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd x y = [x,y]

eftInt :: Int -> Int -> [Int]
eftInt x y = [x,y]


eftChar :: Char -> Char -> [Char]
eftChar x y = [x,y]


myWords :: String -> [[Char]]
myWords x
    | x == "" = init [x]
    | otherwise = [takeWhile (/=' ') x] ++ myWords (drop 1 (dropWhile (/=' ') x)) 


firstSen   = "Tyger Tyger, burning bright\n"
secondSen = "In the forest of the night\n"
thirdSen  = "What immortal hand or eye\n"
fourSen   = "Could frame thy fearful\
             \ symmetry?"

sentences = firstSen ++ secondSen ++ thirdSen ++ fourSen
sentence_list = [firstSen, secondSen, thirdSen, fourSen]


shouldEqual =
    [ "Tyger Tyger, burning bright"
    , "In the forest of the night"
    , "What immortal hand or eye"
    , "Could frame thy fearful symmetry?"
    ]

myLines :: String -> [String]
myLines x
    | x == "" = init [x]
    | otherwise = [takeWhile (/= '\n') x] ++ myLines (drop 1 (dropWhile (/= '\n') x))

main :: IO ()
main =
    print $
    "Are they equal? "
    ++ show (myLines sentences == shouldEqual)

zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = [(x,y)] ++ zip' xs ys

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

flip':: [a] -> [a]
flip' [] = []
flip' (x:xs) = last xs : init xs ++ [x] 

zipWith':: (a-> b -> c) -> [a] -> [b] -> [c]
zipWith' f  _ [] = []
zipWith' f [] _ = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys 

filterUpper :: [Char] -> [Char]
filterUpper x = filter isUpper x

toCapIt :: [Char] -> [Char]
toCapIt (x:xs) = toUpper x : xs
toCapIt _ = ""

toCapAll :: [Char] -> [Char]
toCapAll (x:xs) = toUpper x: toCapAll xs
toCapAll _ = ""

toCapHead :: [Char] -> Char
toCapHead x = toUpper (head x)

toCapHead' :: [Char] -> Char
toCapHead' = toUpper . head 

myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x == True || myOr xs

myAny :: (a-> Bool) -> [a] -> Bool
myAny f [] = False
myAny f (x:xs) = f x == True || myAny f xs

myElem :: Eq a => a -> [a] -> Bool
myElem z [] = False
myElem z (x:xs) = z == x || myElem z xs

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs

squishMap :: (a-> [b]) -> [a] -> [b]
squishMap f [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

maximumBy' :: (a -> a -> Ordering) -> [a] -> a
maximumBy' f (x:y:xs) = if (f x y) == GT then maximumBy' f (x:xs) else maximumBy' f (y:xs)

minimumBy' :: (a -> a -> Ordering) -> [a] -> a
minimumBy' f (x:y:xs) = if (f x y) == LT then minimumBy' f (x:xs) else minimumBy' f (y:xs)

myMaximum ::(Ord a) => [a] -> a
myMaximum [x] = x
myMaximum (x:y:xs) = if x > y then myMaximum (x:xs) else myMaximum (y:xs)