isInt x = x ==fromInteger (round x)

[a | a <- [1..220], fromInteger (round (220 / a)) == (220 / a), a /= 220]

[a | a <- [1..220], 220 `mod` a == 0, a /= 220]

[[a | a <- [1..b], b `mod` a == 0, a /= b]| b <- [1..220]]



map sum [[a | a <- [1..b], b `mod` a == 0, a /= b]| b <-[200..220]]

zip [1..10000] map sum [[a | a <- [1..b], b `mod` a == 0, a /= b]| b <-[1..10000]]



[x | x <- cal_tuple, y <- cal_tuple, fst x == scnd y]



[(d,[[[a | a <- [1..b], b `mod` a == 0, a /= b]| b <- [1..c]]| c <- [1..d]])| d <- [1..220]]

[[[a | a <- [1..b], b `mod` a == 0, a /= b]| b <- [1..c]]| c <- [1..220]]


[(d,[[[a | a <- [1..b], b `mod` a == 0, a /= b]| b <- [1..c]]| c <- [1..d]])| d <- [220]]


(d,[[[a | a <- [1..b], b `mod` a == 0, a /= b]| b <- [1..c]]| c <- [1..d]] | d <- [1..220]])