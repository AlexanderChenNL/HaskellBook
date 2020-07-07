import Data.Numbers.Primes

primes' 1 = []
primes' n = 2:[i | i <- [3,5..n], and [mod i k /= 0 | k <- primes' (isqrt i)]]
isqrt :: Integral a => a -> a
isqrt = floor . sqrt . fromIntegral


chartoString :: Char  -> String
chartoString n  = [n]

circular :: Int -> Int
circular n = read (tail (show n) ++ chartoString (head (show n))) :: Int

-- this was not needed for the current question
factorial :: Int -> Int
factorial 1 = 1
factorial n = n * factorial (n-1)

circular_times :: Int -> [Int]
circular_times n = take (length (show n)) (iterate circular n)

bool_prime :: [Int] -> [Bool]
bool_prime n = map isPrime n 


