module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year
   | (divisible year 100) && (divisible year 400) = True
   | (divisible year 4) && (not (divisible year 100)) = True
   | otherwise = False
   where divisible year x  = (0 == year `mod` x)
