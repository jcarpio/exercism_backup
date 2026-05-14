
score(X, Y, 10 ):- distance(X, Y, D), D =< 1.
score(X, Y, 5 ):- distance(X, Y, D), D > 1, D =< 5.
score(X, Y, 1 ):- distance(X, Y, D), D > 5, D =< 10.
score(X, Y, 0 ):- distance(X, Y, D), D > 10.

distance(X,Y, D):- Z is (X^2 + Y^2),
                     D is sqrt(Z).
