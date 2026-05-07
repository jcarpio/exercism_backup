% isogram(Sentence).
:- use_module(library(clpfd)).

isogram(String):- string_lower(String, R), string_codes(R, R2), remove_blank(R2, R3), all_distinct(R3).

valid(Elem):- [Elem] ins 97..122.
% valid(Elem):- Elem = 32.
% valid(Elem):- Elem = 45.

remove_blank([], []).
remove_blank([H|T], R):- \+ valid(H), remove_blank(T, R).
remove_blank([H|T], [H|R]):- valid(H), remove_blank(T, R).
