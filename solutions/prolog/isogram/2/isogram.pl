:- use_module(library(clpfd)).
%
isogram(String):- string_lower(String, S),
  string_codes(S, S2), 
  delete(S2, 32, S3), delete(S3, 45, S4), 
  all_distinct(S4).
