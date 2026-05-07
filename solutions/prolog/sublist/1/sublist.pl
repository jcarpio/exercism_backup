sublist(List, List, equal).

sublist(List1, List2, sublist):- append([_, List1, _], List2).

sublist(List1, List2, superlist):- append([_, List2, _], List1).

sublist(List1, List2, unequal):- \+ sublist(List1, List2, sublist), \+ sublist(List1, List2, superlist), \+ sublist(List1, List2, equal). 

