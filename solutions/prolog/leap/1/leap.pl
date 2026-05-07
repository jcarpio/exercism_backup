div_by_100(Year):- 0 is mod(Year, 100).

leap(Year):- 0 is mod(Year, 4), \+ div_by_100(Year). 
leap(Year):- 
 0 is mod(Year, 400), 
 0 is mod(Year, 4), 
 0 is mod(Year, 100).
