% pangram(Sentence).
:- use_module(library(clpfd)).

pangram(String):- string_lower(String, R), string_codes(R, R2), remove_blank(R2, R3), sort(R3, R4), R3 ins 97..122, length(R4, 26). 

remove_blank([], []).
remove_blank([H|T], R):- \+ [H] ins 97..122, remove_blank(T, R).
remove_blank([H|T], [H|R]):- [H] ins 97..122, remove_blank(T, R).