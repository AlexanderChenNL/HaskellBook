import Data.Numbers.Primes
import Data.Sort
number_clean = [999..100000]
primes_clean = take 20 primes
power_list = [1..100]
answer = [(x,a^ap,b^bp,c^cp,d^dp) | x <- [999..100000] , a <- primes_clean, b <- primes_clean, c <- primes_clean, d <- primes_clean, ap <- [1..100], bp <- [1..100],cp <- [1..100],dp <- [1..100], (a^ap)*(b^bp)*(c^cp)*(d^dp) == x]

answer_three = [(x,a^ap,b^bp,c^cp) | x <- [640..647] , a <- primes_clean, b <- primes_clean, c <- primes_clean, ap <- [1..3], bp <- [1..3],cp <- [1..3],(a^ap)*(b^bp)*(c^cp)== x]  

list_numbers = [(a^ap*b^bp*c^cp*d^dp) | a <- primes_clean, b <- primes_clean, c <- primes_clean, d <- primes_clean, ap <- [1..10], bp <- [1..10],cp <- [1..10],dp <- [1..10], d > c, c > b, b > a, a^ap*b^bp*c^cp*d^dp > 646, a^ap*b^bp*c^cp*d^dp < 150000] 