
score_letter(L, 1):- member(L, ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't']).
score_letter(L, 2):- member(L, ['d', 'g']).
score_letter(L, 3):- member(L, ['b', 'c', 'm', 'p']).
score_letter(L, 4):- member(L, ['f', 'h', 'v', 'w', 'y']).
score_letter('k', 5).
score_letter(L, 8):- member(L, ['j', 'x']).
score_letter(L, 10):- member(L, ['q', 'z']).

score_list([], 0).
score_list([Head|Tail], R2):-
  score_list(Tail, R),
  score_letter(Head, S),
  R2 is R + S.
  
score(String, R):- string_lower(String, StringLower), 
   string_chars(StringLower, List),
   score_list(List, R).   
  
  


