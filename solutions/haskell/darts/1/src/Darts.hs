module Darts (score) where

score :: Float -> Float -> Int
score x y 
   | distance x y > 10 = 0
   | distance x y <= 10 && distance x y > 5 = 1
   | distance x y > 1 && distance x y <= 5 = 5
   | distance x y <= 1 = 10
   | otherwise = 0
  where distance x y =  sqrt (x^2 + y^2 ) 