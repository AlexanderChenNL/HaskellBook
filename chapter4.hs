

digs :: Integral x => x -> [x]
digs 0 = []
digs x = digs (x `div` 10) ++ [x `mod` 10]

fac :: (Integral a) => a -> a
fac n = product [1..n]

p34 :: Integral x => x -> x
p34 = sum . map fac . digs


a = [(4,8),(9,10),(15,16),(10,4)]

whileloop l = if fac.(last t) `notElem` l then whileloop (fac.(last t)


fac_sum :: (Integral a) => a -> a
fac_sum n = sum (map fac(digs n))
