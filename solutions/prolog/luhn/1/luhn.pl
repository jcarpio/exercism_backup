
codes2numbers([C], [N]):- number_codes(N, [C]). 
codes2numbers([Head|Tail], [N|R]):- codes2numbers(Tail, R), number_codes(N, [Head]).

valid(String):- string_codes(String, R), reverse(R, R2), 
  delete_blank(R2, R3), all_numbers(R3),
  codes2numbers(R3, R4), R4 \= [0], multi(R4, R5),
 sumlist(R5, R6), 0 is R6 mod 10.

all_numbers([]).
all_numbers([H|T]):- is_number(H), all_numbers(T).
 
is_number(Code):- Code >= 48, Code =< 57.

is_blank(32).
 
delete_blank([], []).
delete_blank([Head|Tail], R):- is_blank(Head), delete_blank(Tail, R). 
delete_blank([Head|Tail], [Head|R]):- \+ is_blank(Head), delete_blank(Tail, R). 
 
multi([], []).

% multi([H], [H3]):- H2 is H * 2, H2 > 9, H3 is H2 - 9.
% multi([H], [H2]):- H2 is H * 2, H2 =< 9. 

multi([H], [H]).

multi([H1, H2|Tail], [H1, H3|R]):- H22 is H2 * 2, H22 > 9, H3 is H22 - 9,
 multi(Tail, R).
 
multi([H1, H2|Tail], [H1, H22|R]):- H22 is H2 * 2, H22 =< 9, 
 multi(Tail, R).