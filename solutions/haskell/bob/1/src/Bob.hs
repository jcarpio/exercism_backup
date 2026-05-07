module Bob (responseFor) where

import Data.Char (isAlpha, isSpace, isUpper)

responseFor :: String -> String
responseFor input
  | all isSpace input = "Fine. Be that way!"
  | isYelling input && isQuestion input = "Calm down, I know what I'm doing!"
  | isYelling input = "Whoa, chill out!"
  | isQuestion input = "Sure."
  | otherwise = "Whatever."

-- Check if the input is a question
isQuestion :: String -> Bool
isQuestion xs = case dropWhileEnd isSpace xs of
                  [] -> False
                  trimmed -> last trimmed == '?'

-- Check if the input is yelling
isYelling :: String -> Bool
isYelling xs = any isAlpha xs && all (\c -> not (isAlpha c) || isUpper c) xs

-- Helper to drop spaces from the end
dropWhileEnd :: (Char -> Bool) -> String -> String
dropWhileEnd p = reverse . dropWhile p . reverse

