tensDigit :: Integral a => a ->a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10

tensDigit' x = d
     where d = fst (divMod x 10) `mod` 10
