% Exercise 1: substitute(X, Y, L1, L2)

substitute(_, _, [], []).
substitute(X, Y, [X|T1], [Y|T2]):-
    substitute(X, Y, T1, T2).
substitute(X, Y, [H|T1], [H|T2]):-
    X \= H,
    substitute(X, Y, T1, T2).

%_______________________________________________________________________________
% Exercise 2: adjacent(X, Y, Zs)

adjacent(_, _, []).
adjacent(_, _, [_]).
adjacent(X, Y, [X, Y | T]):-
    adjacent(X, Y, T).
adjacent(X, Y, [Y, X | T]):-
    adjacent(X, Y, T).
adjacent(X, Y, [H1, H2 | T]):- %issue happening here
    X \= H1, X \= H2,
    Y \= H1, Y \= H2,
    adjacent(X, Y, T).

%_______________________________________________________________________________
% Exercise 3: The International Neighborhood Hobbyists Puzzle

