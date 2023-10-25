% Q1: define sum_lists/3 ==> sum_lists(List1, List2, ListOfSums)

%Q1A: implement one that fails if two lists are diff lenghts
sum_lists([], [], []).

sum_lists([H1|T1], [H2|T2], [RH|RT]):-
    RH is H1 + H2,
    sum_lists(T1, T2, RT).


isSameLength([], []).

isSameLength([_|T1], [_|T2]):-
    isSameLength(T1, T2).

sum_lists1(List1, List2, Output):-
    isSameLength(List1, List2),
    sum_lists(List1, List2, Output).

%Q1B: implement one that appends remaining elements to end of summed list

sum_lists2([], [], []):- !.

sum_lists2([H1|T1], [H2], [RH|RT]):-
    RH is H1 + H2,
    RT = T1,
    !.

sum_lists2([H1], [H2|T2], [RH|RT]):-
    RH is H1 + H2,
    RT = T2,
    !.

sum_lists2([H1|T1], [H2|T2], [RH|RT]):-
    RH is H1 + H2,
    sum_lists2(T1, T2, RT).


%Q2: write substitute(X, Y, TreeA, TreeB) that replaces all occurences of X in the binary tree TreeA by Y to produce a result that is TreeB.

% Tree structure: tree(data, left child, right child)
% Ex. Tree: tree(a, tree(b, void, void), tree(c, void void))

% Ex. substitute: substitute(b, g, tree(a,tree(b, void, void), tree(c, void, void)),X).
% X = tree(a, tree(g, void, void), tree(c, void, void)) ;

test2(X):-
    substitute(b, g, tree(a,tree(b, void, void), tree(c, void, void)), X).

substitute(_, _, void, void).

substitute(X, Y, tree(X, L, R), tree(Y, NewL, NewR)):-
    substitute(X, Y, L, NewL),
    substitute(X, Y, R, NewR).

substitute(X, Y, tree(Data, L, R), tree(Data, NewL, NewR)):-
    X\=Data,
    substitute(X, Y, L, NewL),
    substitute(X, Y, R, NewR).

% Q3: write first_n(List1, N, List2) which instantiates List2 as a list containing the first N elements of List1. 1st arg is a list, 2nd is an integer. You can assume it will always be calld with the first 2 arguments correctly instantiated. Edge-case - should fail if N > length(List1).

first_n([H1|_], 1, [H1]).

first_n([H1|T1], N, [H1|T2]):-
    N >= 0,
    X is N-1,
    first_n(T1, X, T2).
