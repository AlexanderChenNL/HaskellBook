
:load "Primes.hs"
a = filter isPrime [x | x <- [1..7072]]
b = filter isPrime [x | x <- [1..7072]]
c = filter isPrime [x | x <- [1..85]]

euler_list  = [x+y+z | x <- a, y <- b,  z<-c, x+y+z <50]
