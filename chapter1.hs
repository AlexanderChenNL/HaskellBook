product_to [] = 1 
product_to (n:ns) =  n  *  product_to ns

qsort [] = []
qsort (x:xs) = qsort larger  ++  [x] ++  qsort smaller
         where
          smaller =  [a | a  <- xs,  a  <=  x]
          larger    =  [b | b  <- xs,  b  >  x]

n = a `div` length xs
                where 
                         a = 10
                         xs  = [1,2,3,4,5]

last' x = x  !! (length x -1)



digits :: Integer -> [Int]
digits n = map (\x -> read [x] :: Int) (return n)