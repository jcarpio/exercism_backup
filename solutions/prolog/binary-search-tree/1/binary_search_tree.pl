% from_data(Data, Tree).

% to_data(Tree, Data).

from_data(Data, Tree):- msort(Data, D), to_data(Tree, D).

to_data(nil, []).
to_data(tree_node(Label, Left, Right),   Data):- length(Data, L), L > 0, L2 is L div 2,
  length(List1, L2),
  append(List1, [Label|List2], Data),
  to_data(Left, List1),
  to_data(Right, List2). 

from_data(Data, Tree) :-
    from_data_aux(Data, nil, Tree).

from_data_aux([], Tree, Tree).



from_data_aux([H|T], Tree, R2) :-
    insert(Tree, H, R),
    from_data_aux(T, R, R2).


insert(nil, Elem, tree_node(Elem, nil, nil)).


insert(tree_node(Label, Left, Right), Elem, tree_node(Label, RL, Right)) :-
    Elem < Label,
    insert(Left, Elem, RL). 

insert(tree_node(Label, Left, Right), Elem, tree_node(Label, Left, RR)) :-
    Elem > Label,
    insert(Right, Elem, RR).
