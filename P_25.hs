import Data.Numbers.Primes
import Data.Numbers.Fibonacci


fibonacci_list = [ fib x | x <- [1..500]]  

answer = head [x | x <- [1..500000], (length (show (fib x))) >= 1000]