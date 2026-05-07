leap(Year):- 0 is mod(Year, 4), \+  0 is mod(Year, 100).

leap(Year):- 
 0 is mod(Year, 400), 
 0 is mod(Year, 100).