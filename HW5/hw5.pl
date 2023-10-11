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


test1:- 
    swap(tree(tree(leaf(1), leaf(2)), leaf(4)), T).
    %tree(tree(A), leaf(4)). -swap-> T = tree(leaf(4), tree(A)).


% swap(tree(null, null), tree(null, null)). %

% swap(tree(leaf(A), null), tree(null, leaf(A))).

% swap(tree(null, leaf(A)), tree(leaf(A), null)).

% swap(tree(leaf(A), leaf(B)), tree(leaf(B), leaf(A))). %SWAPPING TWO LEAF NODES

% swap(tree(tree(A), leaf(X)), tree(leaf(X), tree(A))):-
%   swap(A, _). 

% swap(tree(leaf(X), tree(A)), tree(tree(A), leaf(X))).
%   swap(A, _).

% swap(tree(A, B), tree(B, A)):-
%   swap(A, _),
%   swap(B, _).

swap(tree(leaf(A), leaf(B)), tree(leaf(B), leaf(A))):-
  write(case1), nl. %SWAPPING TWO LEAF NODES

swap(tree(tree(A), leaf(X)), tree(leaf(X), tree(R))):-
  write(case2), nl,
  swap(A, R). 

swap(tree(leaf(X), tree(A)), tree(tree(R), leaf(X))):-
  write(case3), nl,
  swap(A, R).

swap(tree(tree(A), tree(B)), tree(tree(RB), tree(RA))):-
  write(case4), nl,
  swap(A, RA),
  swap(B, RB).

