import Data.List


incTimes :: (Eq a, Num a) => a -> a -> a
incTimes 0 n = n
incTimes times n = 
    10 + (incTimes (times - 1) n )

applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes 0 f b = b
applyTimes n f b = f . applyTimes (n-1) f $ b

func :: [a] -> [a] -> [a]
func x y = x ++ y

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

appedCatty = cattyConny "woops"
flippy= flip cattyConny

frappe = flippy "haha"

sumIt :: (Eq a, Num a) => a -> a
sumIt 0 = 0
sumIt n = n + (sumIt (n -1))

integralThis :: (Integral a) => a -> a -> a
integralThis x 1 = x
integralThis x y = x + (integralThis x (y - 1))

mc91 :: (Ord a, Num a) => a -> a
mc91 n =
    case n > 100 of
        True -> n - 10
        False -> mc91 (mc91 (n+11))


digitToWord :: Integer -> String
digitToWord 0 = "Zero"
digitToWord 1 = "One"
digitToWord 2 = "Two"
digitToWord 3 = "Three"
digitToWord 4 = "Four"
digitToWord 5 = "Five"
digitToWord 6 = "Six"
digitToWord 7 = "Seven"
digitToWord 8 = "Eight"
digitToWord 9 = "Nine"
digitToWord _ = error "Only 0-9 accepted"

toDigits :: Integer -> [Integer] -- 12 -> [1,2], 0 -> [0], 10 -> [1,0]
toDigits x
    | x < 10 = [x]
    | otherwise = toDigits (div x 10) ++ [mod x 10]



toStringIt :: [[Char]] -> String  -- adds the '-' and brings it all back to a [char]
toStringIt x = concat $ intersperse "-" x

wordNumber :: Integer -> String  -- puts it all together.
wordNumber x = toStringIt . map digitToWord $ toDigits x


    