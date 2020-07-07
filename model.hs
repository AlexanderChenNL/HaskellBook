import Data.Char                        -- Needed for "ord" and "chr"

alphabetLength :: Int
alphabetLength = length alphabet

alphabet :: [Char]
alphabet = ['A'..'Z']

isAlphabetic :: Char -> Bool
isAlphabetic = flip elem alphabet       -- I don't realy get, why I need "flip" here, but it doesn't work without it. Why?

shiftChar :: Char -> Int -> Char
shiftChar char shift
    | isAlphabetic char = chr ((((ord char + shift) - base) `mod` alphabetLength) + base)
    | otherwise      = char
    where base = 65

encrypt :: String -> Int -> String
encrypt string shift = [shiftChar (toUpper x) shift | x <- string]  -- "Loop" through string to encrypt char by char

decrypt :: String -> Int -> String
decrypt string shift = encrypt string (negate shift)

main :: IO()
main = print(decrypt "KHOOR, ZRUOG!" 3)

