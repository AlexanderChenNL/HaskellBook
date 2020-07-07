module Cipher where

import Data.Char

--converts from character (lower and upper case allowed) to Integer 
toOrd :: [Char] -> [Int]
toOrd = map ord 

--converts from integer to Character (lower and upper case possible)
toChar :: [Int] -> [Char]
toChar = map chr

--adds the x variable, takes the mod into account and character range [65..122]
toConvert :: Integral b => b -> [b] -> [b]
toConvert x y = map (+ k) y
    where k = mod x 58

--subtracts the x variable, takes the mod into account and character range [65..122]
toConvertBack :: Integral b => b -> [b] -> [b]
toConvertBack x y = map (+ negate k)  y
    where k = mod x 58

--normalizes the list, because it starts at 65 and end at 122
toNormalize :: [Int] -> [Int]
toNormalize = map (\x -> if x > 122 then (65 + x-122) else x)

--normalizes the list, because it starts at 65 and end at 122
toNormalizeBack :: [Int] -> [Int]
toNormalizeBack = map (\x -> if x < 65 then (122 - (65 - x)) else x)

toCipher :: Int -> [Char]-> [Char]
toCipher x =toChar . toNormalize . toConvert x . toOrd 

toUnCipher :: Int -> [Char]-> [Char]
toUnCipher x = toChar . toNormalizeBack . toConvertBack x . toOrd