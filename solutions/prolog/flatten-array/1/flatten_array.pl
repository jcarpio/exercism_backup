% flatten_list(Xs, XsFlattened)

flatten_list([], []).

flatten_list([H|T], R):- is_list(H), flatten_list(H, RH),
  flatten_list(T, RT), append(RH, RT, R).

flatten_list([nil|T], RT):- flatten_list(H, RH),
  flatten_list(T, RT).


flatten_list([H|T], [H|RT]):- \+ is_list(H),
  flatten_list(T, RT).
