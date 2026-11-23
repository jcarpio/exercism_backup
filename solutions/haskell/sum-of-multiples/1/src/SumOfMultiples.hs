module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors level =
    sum [n | n <- [1 .. level - 1], any (divides n) factors]
  where
    divides n factor = factor /= 0 && n `mod` factor == 0