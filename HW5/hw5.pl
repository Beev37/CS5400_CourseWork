%Exercise 1: LPN Ex. 3.5

/*
Binary trees are trees where all internal nodes have exactly two children. The smallest binary trees consist of only one leaf node. We will represent leaf nodes as leaf(Label) . For instance, leaf(3) and leaf(7) are leaf nodes, and therefore small binary trees. Given two binary trees B1 and B2 we can combine them into one binary tree using the functor tree/2 as follows: tree(B1,B2) . So, from the leaves leaf(1) and leaf(2) we can build the binary tree tree(leaf(1),leaf(2)) . And from the binary trees tree(leaf(1),leaf(2)) and leaf(4) we can build the binary tree tree(tree(leaf(1),  leaf(2)),leaf(4)) . 

 Now, define a predicate swap/2 , which produces the mirror image of the binary tree that is its first argument. For example:
   ?-  swap(tree(tree(leaf(1),  leaf(2)),  leaf(4)),T).
   T  =  tree(leaf(4),  tree(leaf(2),  leaf(1))).
   yes 
*/

%____Attempt 1:
% swap(tree(null, null), _).
% swap(tree(A, null), R):-
%     swap(A, R).
% swap(tree(null, A), R):-
%     swap(A, R).
% swap(tree(A, B), R):-
%     swap(A, R),
%     swap(B, R).

%____Attempt 2:
% swap(tree(leaf(A), leaf(B)), tree(leaf(B), leaf(A))). %SWAPPING TWO LEAF NODES

% swap(tree(tree(A), leaf(X)), tree(leaf(X), tree(A))):-
%   swap(A, _). 

% swap(tree(leaf(X), tree(A)), tree(tree(A), leaf(X))):-
%   swap(A, _).

% swap(tree(tree(A), tree(B)), tree(tree(B), tree(A))):-
%   swap(A, _),
%   swap(B, _).

%____Attempt 3:
% swap(tree(leaf(A), leaf(B)), tree(leaf(B), leaf(A))).

% swap(tree(tree(A), leaf(X)), tree(leaf(X), tree(R))):-
%   swap(A, R). 

% swap(tree(leaf(X), tree(A)), tree(tree(R), leaf(X))):-
%   swap(A, R).

% swap(tree(tree(A), tree(B)), tree(tree(RB), tree(RA))):-
%   swap(A, RA),
%   swap(B, RB).

test1:- 
    swap(tree(tree(leaf(1), leaf(2)), leaf(4)), T).
    %tree(tree(A), leaf(4)). -swap-> T = tree(leaf(4), tree(A)).

swap(leaf(X), leaf(X)).

swap(tree(X, Y), tree(NewY, NewX)):-
    swap(X, NewX),
    swap(Y, NewY).


%Exercise 2: Subtree(S, T)
%ASSUMPTION: There will never be a node with only one child.

% structure = tree(Label, Left, Right)

% tree(a, tree(b, tree(d, void, void), tree(e, tree(h, void, void), tree(i, void, void))), tree(c, tree(f, void, void), tree(g, void, void))).

% testing if finding subtree works with bigger tree to search through
test2:-
    subtree(tree(c, tree(f, void, void), tree(g, void, void)), tree(a, tree(b, tree(d, void, void), tree(e, tree(h, void, void), tree(i, void, void))), tree(c, tree(f, void, void), tree(g, void, void)))).

%____Attempt 1:
% subtree(tree(X, void, void), tree(X, void, void)).

% subtree(tree(X, Y, Z), tree(X, Y1, Z1)):-
%     subtree(Y, Y1),
%     subtree(Z, Z1).

%____Attempt 2:
subtree(X, X):-
    X\=void.

subtree(Input, tree(_, L, _)):-
    subtree(Input, L).

subtree(Input, tree(_, _, R)):-
    subtree(Input, R).

%____Attempt 3:
% subtree(Subtree, tree(A, L, R)):-
%     subtree([], Subtree, tree(A, L, R)).

% subtree(Input, Input, _).

% subtree(Visited, Input, tree(H, L, R)):-
%     \+ member()





