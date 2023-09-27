 % Exercise 1: LPN exerices from chpt. 5
 /*
 Exercise  5.1 How does Prolog respond to the following queries?

    X  =  3*4.
        > X = 3*4

    X  is  3*4.
        > X = 12
    
    4  is  X.
        > instantiation error
    
    X  =  Y.
        > X = Y
    
    3  is  1+2.
        > true
    
    3  is  +(1,2).
        > true
    
    3  is  X+2.
        > instantiation error
    
    X  is  1+2.
        > X = 3.
    
    1+2  is  1+2.
        > false 
        %(I thought this would be true, but because the left side is considered a complex 
            % term it can't unify with the evaluated 3 on the right hand side.)
    
    is(X,+(1,2)).
        > X = 3
    
    3+2  =  +(3,2).
        > true
        %(I thought this would be false provided the '1+2 is 1+2' returned false as well. It 
            % seems that the unification only cares about structure of terms and if they match;
            % where as 'is' cares about the structure of the whole clause that needs a variable
            % or singular integer on the left.)
    
    *(7,5)  =  7*5.
        > true
        %(Interestingly enough, the input '*(7,5) = 7*5' yields true, yet '*(7,5) = 5*7' yields false.)
    
    *(7,+(3,2))  =  7*(3+2).
        > true
    
    *(7,(3+2))  =  7*(3+2).
        > true
    
    7*3+2  =  *(7,+(3,2)).
        > false
    
    *(7,(3+2))  =  7*(+(3,2)).
        > true
*/

%_______________________________________________________________________________
% Exercise 2: Successor Structures

natural_number(0).
natural_number(s(X)):- 
    natural_number(X).

plus(0, X, X) :- natural_number(X).
plus(s(X), Y, s(Z)) :- 
    plus(X, Y, Z).

times(0, _, 0).
times(s(X), Y, Product) :-
    times(Y, X, Previous),
    plus(Previous, Y, Product).

factorial(0, _).
factorial(s(X), Result):- 
    times(s(X), X, Result).

% test1:- factorial(s(s(s(s(0)))), X), write(X), nl.
% test2:- factorial(s(s(s(0))), X), write(X), nl.


%_______________________________________________________________________________
% Exercise 3: Math Maze

% list = [N1,+,13,*,N2,/,N3,+,N4,+,12,*,N5,-,N6,-,11,+,N7,*,N8,/,N9,-,10,=,66]
%            6    1    2    7    8    3    9    10   11   4    5    12      

mathmaze(X):-
    permutation([1,2,3,4,5,6,7,8,9],X),
    tryMaze(X).
    
tryMaze([N1,N2,N3,N4,N5,N6,N7,N8,N9]):-
    66 is N1+13*N2/N3+N4+12*N5-N6-11+N7*N8/N9-10.


%_______________________________________________________________________________
% Exercise 4: Doubled List

double([], []).
double([Head|Tail], [DH1, DH2|DT]):-
    DH1 = Head,
    DH2 = Head,
    double(Tail, DT).


%_______________________________________________________________________________
% Exercise 5: Ordered Triples


orderedTriples([],[],[],[]).
orderedTriples([LH1|T1],[LH2|T2],[LH3|T3], [Result|RT]):-
    msort([LH1,LH2,LH3], Result),
    orderedTriples(T1,T2,T3,RT).
