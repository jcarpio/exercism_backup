

/*

find(+List, +Elem, -Index)

The algorithm looks like this:

Find the middle element of a sorted list and compare it with the item we're looking for.
If the middle element is our item, then we're done!
If the middle element is greater than our item, we can eliminate that element and all the elements after it.
If the middle element is less than our item, we can eliminate that element and all the elements before it.
If every element of the list has been eliminated then the item is not in the list.
Otherwise, repeat the process on the part of the list that has not been eliminated.
Here's an example:

Let's say we're looking for the number 23 in the following sorted list: [4, 8, 12, 16, 23, 28, 32].

We start by comparing 23 with the middle element, 16.
Since 23 is greater than 16, we can eliminate the left half of the list, leaving us with [23, 28, 32].
We then compare 23 with the new middle element, 28.
Since 23 is less than 28, we can eliminate the right half of the list: [23].
We've found our item.

*/

find([Elem], Elem, 0).

find(List, Elem, Med2):- length(List, L), L > 1, Med is L div 2, Med2 is Med - 1, length(L1, Med2), append(L1, [Elem|_], List).

find(List, Elem, Index):- length(List, L), L > 1, Med is L div 2, Med2 is Med - 1, length(L1, Med2), append(L1, [E|_], List), E \= Elem, Elem < E,
  find(L1, Elem, Index).
  
find(List, Elem, Sol):- length(List, L), L > 1, Med is L div 2, Med2 is Med - 1, length(L1, Med2), append(L1, [E|L2], List), E \= Elem, Elem > E,
  find(L2, Elem, Index), Sol is Index + Med.
  
find(List, Elem, Sol):- length(List, L), L > 1, Med is L div 2, Med2 is Med - 1, length(L1, Med2), append(L1, [E|L2], List), E \= Elem, Elem > E,
  find(L2, Elem, Index), Sol is Index + Med.

