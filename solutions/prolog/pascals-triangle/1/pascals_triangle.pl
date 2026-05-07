% pascal(NumRows, Rows).
/*
    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
# ... etc

 pascal(3, Rows) -> Rows == [[1], [1,1], [1,2,1]].
 pascal(2, Rows)  -> Rows == [[1], [1,1]].

*/

pascal(0, []).
pascal(1, [[1]]).
pascal(N,  R5):- N > 1, N2 is N - 1, pascal(N2, R), last(R, R2), create_pascal_row(R2, R3), append([1|R3], [1], R4), append(R, [R4], R5).


create_pascal_row([], []).
create_pascal_row([1], []).
create_pascal_row([H1,H2|T], [Second|R]):-  Second is H1 + H2, create_pascal_row([H2|T], R).