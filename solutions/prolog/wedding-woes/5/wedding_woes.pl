        % Define the 'chatty' fact
        
        chatty(gustavo).
        chatty(valeria).
        
        
        % Define the 'likes' fact
        
        likes(esteban, malena).
        likes(malena, esteban).
        likes(gustavo, valeria).
        
        % Define the 'pairing' rule
        
        pairing(X, Y) :- likes(X, Y), likes(Y, X).
        pairing(X, _) :- chatty(X).
        pairing(_, Y) :- chatty(Y).
        
        
        % Define the 'seating' rule

        seating(A,B,C,D,E):- seating2([A,B,C,D,E]).
        
        seating2([E|L2]):- append(L1, [_], [E|L2]), maplist(pairing, L1, L2).

     
  
