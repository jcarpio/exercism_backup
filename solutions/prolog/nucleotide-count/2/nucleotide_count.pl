nucleotide_count(String, _):-
   string_upper(String, String2),
   string_chars(String2, Chars),  maplist(valid, Chars).
   
valid('A').
valid('C').
valid('G').
valid('T').
 