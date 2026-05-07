
% tree_traversals(Tree, Preorder, Inorder)

tree_traversals(nil, [], []).

tree_traversals(node(Left, Label, Right), RP, RI):- var(RP),
  tree_traversals(Left, RLP, RLI), tree_traversals(Right, RRP, RRI), append([Label|RLP], RRP, RP), append(RLI, [Label|RRI], RI).
  
% create_tree(P, I, T)

tree_traversals(Tree, RP, RI):- RP \= [], \+ var(RP), \+ var(RI), same_length(RP, RI), create_tree(Tree, RP, RI).

create_tree(nil, [], []).
create_tree( node(LeftTree, Label, RightTree), [Label|TP], I):- append(LI2, [Label|RI2], I), length(LI2, L), length(LP2, L), append(LP2, RP2, TP), 
   create_tree(LeftTree, LP2, LI2), create_tree(RightTree, RP2, RI2).


