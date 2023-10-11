%Exercise 1: LPN Ex. 3.5

/*
Binary trees are trees where all internal nodes have exactly two children. The smallest binary trees consist of only one leaf node. We will represent leaf nodes as leaf(Label) . For instance, leaf(3) and leaf(7) are leaf nodes, and therefore small binary trees. Given two binary trees B1 and B2 we can combine them into one binary tree using the functor tree/2 as follows: tree(B1,B2) . So, from the leaves leaf(1) and leaf(2) we can build the binary tree tree(leaf(1),leaf(2)) . And from the binary trees tree(leaf(1),leaf(2)) and leaf(4) we can build the binary tree tree(tree(leaf(1),  leaf(2)),leaf(4)) . 

 Now, define a predicate swap/2 , which produces the mirror image of the binary tree that is its first argument. For example:
   ?-  swap(tree(tree(leaf(1),  leaf(2)),  leaf(4)),T).
   T  =  tree(leaf(4),  tree(leaf(2),  leaf(1))).
   yes 
*/

% tree(tree(leaf(1), leaf(2)), leaf(4)).

% tree(leaf(1), null).

% swap(tree(null, null), _).
% swap(tree(A, null), R):-
%     swap(A, R).
% swap(tree(null, A), R):-
%     swap(A, R).
% swap(tree(A, B), R):-
%     swap(A, R),
%     swap(B, R).

% test0:-
%     swap(tree(leaf(1), null), T).

% test1:- 
%     swap(tree(tree(leaf(1), leaf(2)), leaf(4)), T).


swap(tree(null, null), tree(null, null)).
swap(tree(leaf(A), leaf(B)), tree(leaf(B), leaf(A))).
swap(tree(leaf(A), null), tree(null, leaf(A))).
swap(tree(null, leaf(A)), tree(leaf(A), null)).
swap(tree(A, leaf(_)), tree())
swap(tree(A, B), tree(B, A)):-
    swap(A, _),
    swap(B, _).

