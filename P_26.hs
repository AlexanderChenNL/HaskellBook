primes 1 = []
primes n = 2:[i | i <- [3,5..n], and [mod i k /= 0 | k <- primes (isqrt i)]]
isqrt :: Integral a => a -> a
isqrt = floor . sqrt . fromIntegral

cycleLength :: Integer -> Integer
cycleLength n | even n = 0
    | n `rem` 5 == 0 = 0
    | otherwise = head [p | p <- [1..], (10^p - 1) `rem` n == 0]

cycleLength' :: Integer -> [Integer]
cycleLength' n 
    | even n = []
    | n `mod` 5 == 0 = []
    | otherwise =  [p | p <- [1..], (10^p - 1) `mod` n == 0]


