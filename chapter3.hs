digs :: Integral x => x -> [x]
digs 0 = []
digs x = digs (x `div` 10) ++ [x `mod` 10]

fac :: (Integral a) => a -> a
fac n = product [1..n]

p34 :: Integral x => x -> x
p34 n = sum (map fac (digits n))