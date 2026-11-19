
:- use_module(library(clpfd)).

/*

If c is the number of columns and r is the number of rows, then for the rectangle r x c find the smallest possible integer c such that:

r * c >= length of message,
and c >= r,
and c - r <= 1.

*/

% encode(Plaintext, Ciphertext).
encode(Input, R2):- encode2(Input, R), string_chars(R2, R).

encode2(Input, Clean):- clean_string(Input, Clean), length(Clean, L), L =< 1.

encode2(Input, R5):- clean_string(Input, Clean), length(Clean, L), L > 1,
    find_cd(C,R,L), Total is C * R, length(ListSquare, Total), 
    append(Clean, _, ListSquare),
    create_matrix(C, R, Matrix), append(Matrix, ListSquare),
    transpose(Matrix, R2), 
    add_trailing_spaces(R2, R3),
    append(R3, R4), 
    fill_spaces(R4),
    remove_last_white(R4, R5).

find_cd(C, R, L):- 
  Vars = [C, R],
  Vars ins 1..L,
  L #=< R * C,
  C #>= R,
  1 #>= C - R,
  labeling([min(C)], Vars).
 
clean_string(Input, CleanChars) :-
    string_lower(Input, Lower),
    string_chars(Lower, Chars),
    exclude(is_space_or_punct, Chars, CleanChars).

is_space_or_punct(Char) :- char_type(Char, space).
is_space_or_punct(Char) :- char_type(Char, punct).

create_matrix(C, R, Matrix) :-
    length(Matrix, R),
    maplist(create_row(C), Matrix).

create_row(C, Row) :-
    length(Row, C).

fill_spaces(List) :-
    maplist(bind_space, List).

bind_space(X) :-
    ignore(X = ' ').

add_trailing_spaces(Matrix, Result) :-
    maplist(append_space, Matrix, Result).

append_space(Row, NewRow) :-
    append(Row, [' '], NewRow).

remove_last_white(List, R):-
   append(R, [' '], List).

remove_last_white(List, List):-
   append(_, [Elem], List), Elem \= ' '.
