
string_reverse(String, Solution):- string_codes(String, Codes), list_reverse(Codes, R), string_codes(Solution, R).

list_reverse([], []).
list_reverse([Head|Tail], R2):- list_reverse(Tail, R), append(R, [Head], R2).



