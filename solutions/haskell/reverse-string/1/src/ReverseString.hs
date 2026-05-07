module ReverseString (reverseString) where

reverseString :: String -> String
reverseString [] = []
reverseString (x:xs) = reverse(xs) ++ [x]
