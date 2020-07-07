import Data.Numbers.Primes

primes' 1 = []
primes' n = 2:[i | i <- [3,5..n], and [mod i k /= 0 | k <- primes' (isqrt i)]]
isqrt :: Integral a => a -> a
isqrt = floor . sqrt . fromIntegral


chartoString :: Char  -> String
chartoString n  = [n]

circular :: Integer -> Integer
circular n = read (tail (show n) ++ chartoString (head (show n))) :: Integer


--- only works with Int of 4 digits
async :: Integer -> Integer
async n = read (init (tail (show n)) ++ chartoString (head (show n)) ++ chartoString (last (show n))) :: Integer

primes_dirty = take 1000000 primes
primes_clean = [ x | x <- primes_dirty, x > 999, x < 10000]

answer = [x| x <- primes_clean, abs ((async x) - x) == 3330, abs ((async x)-(async (async x))) == 3330, isPrime (async x) == True, isPrime (async (async x)) == True]