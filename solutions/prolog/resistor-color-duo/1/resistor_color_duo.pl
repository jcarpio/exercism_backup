value([], 0).
value([Head], R):- color_code(Head, Code),
  R is Code.   
value([Head1, Head2|_], R):- 
  color_code(Head1, Code1),
  color_code(Head2, Code2),
  R is Code1 * 10 + Code2. 
  
color_code("black", 0).
color_code("brown", 1).
color_code("red", 2).
color_code("orange", 3).
color_code("yellow", 4).
color_code("green", 5).
color_code("blue", 6).
color_code("violet", 7).
color_code("grey", 8).
color_code("white", 9).

colors(Colors):- 
  Colors = [
            "black",
            "brown",
            "red",
            "orange",
            "yellow",
            "green",
            "blue",
            "violet",
            "grey",
            "white"
        ].