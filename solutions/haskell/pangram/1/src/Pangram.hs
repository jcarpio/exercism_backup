module Pangram (isPangram) where

import Data.Char (toLower, isLetter)
import Data.List (nub)

import Data.Char (toLower, isAscii, isLetter)
import Data.List (nub)

isPangram :: String -> Bool
isPangram sentence = length (nub lettersOnly) == 26
  where
    lettersOnly = [toLower c | c <- sentence, isAscii c, isLetter c]