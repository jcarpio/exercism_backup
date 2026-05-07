square(1, 1).
square(N, R2):- N =< 64, N > 1, N2 is N - 1, square(N2, R), R2 is 2 * R.

square_list(1, 1, [1]).
square_list(N, R2, [R2|L]):- N =< 64, N > 1, N2 is N - 1, square_list(N2, R, L), R2 is 2 * R.

total(Total):- square_list(64, _, List), sum_list(List, Total).


% total(R):- R is 2^64 - 1.