tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10
