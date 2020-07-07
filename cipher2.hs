import Data.Char

--C:\Users\achen\Desktop\Haskell\cipher2.hs
--- :set prompt  "\x03BB> "


shiftChar :: Char -> Int -> Char
shiftChar char shift
    | isUpper char = chr ((((ord char + shift) - upperbase) `mod`  length ['A'..'Z']) + upperbase)
    | isLower char = chr ((((ord char + shift) - lowerbase) `mod` length ['a'..'z']) + lowerbase)
    | otherwise      = char
    where upperbase = ord 'A'
          lowerbase = ord 'a'

encrypt :: String -> Int -> String
encrypt string shift = [shiftChar x shift | x <- string]

decrypt :: String -> Int -> String
decrypt string shift = encrypt string (negate shift)

squish :: [[a]] -> [a]
squish = foldr (++) []  

splitList::[a]->[b]->[(a,b)]
splitList [] _ = []
splitList _ [] = []    
splitList cryptIt nameCode 
    | length cryptIt <= length nameCode = zip cryptIt nameCode
    | otherwise                          = zip cryptIt (cycle nameCode) 

internal :: Char -> Char -> Char
internal x y = chr $ ord x + (ord y - ord 'A')

cryptionName :: [Char]-> [Char]
cryptionName x = cycle x

shiftingCypher :: Char -> Char -> Char
shiftingCypher x y
    | isUpper x = chr ((((ord x + (ord y - 65))- 65) `mod`  26) + ord 'A')
    | otherwise = x

trailOne :: [Char]
trailOne = zipWith shiftingCypher "MEET AT DAWN" (cycle "ALLY")

messageString ::[Char]
messageString = "MEET AT DAWN"

stringMatch :: [Char]-> [Char]->[Char]
stringMatch  _ [] = error "Too few arguments"
stringMatch [] _ = []
stringMatch (y:ys) (x:xs)
    | isUpper y = x : stringMatch ys xs
    | otherwise = y : stringMatch ys (x:xs)

isSubseqOf :: [Char] -> [Char] -> Bool
isSubseqOf a b =  a == [ x | x <- b, elem x a ]

capitalizeOneWord :: String -> (String,String)
capitalizeOneWord x = (x,(toCapHead x))

toCapHead :: String -> [Char]
toCapHead "" = []
toCapHead (x:xs) = (toUpper x) : xs

capitalizeWords :: String -> [(String,String)]
capitalizeWords x =  map capitalizeOneWord (words x)

picks :: [x] -> [([x], x, [x])]
picks []    = []
picks (x : xs) = ([], x , xs) : [(x : bs, y, as) | (bs,y,as) <- picks xs]

--problem_29 :: [Integer]
--problem_29 = [x^y | x <-[2..100], y <- [2..100]]

duplicate :: Eq a => [a] -> [a]
duplicate [] = []
duplicate (x:xs)
    | x `elem` xs = duplicate xs
    | otherwise   = x : duplicate xs

myIterate :: (a -> a) -> a -> [a]
myIterate f x = (f x) : myIterate f (f x)

myUnfoldr :: (b -> Maybe (a,b)) -> b -> [a]
myUnfoldr f x = case f x of
    Just (next, state) -> next : myUnfoldr f state
    Nothing            -> []

fun :: Num b => b -> Maybe (b,b) 
fun b = Just (b, b + 1)

