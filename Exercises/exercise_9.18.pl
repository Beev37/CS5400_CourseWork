
edge(a,b).
edge(a,c).
edge(b,d).
edge(c,d).
edge(d,e).
edge(f,g).

    %below is class example that I tried myself and got to work for both ways
connected_forward(X,Y) :- edge(X,Y).
connected_forward(X,Y) :- edge(X,Z), connected_forward(Z,Y).

% connected_backwards(Y,X) :- edge(Y,X).
% connected_backwards(Y,X) :- edge(Y,Z), connected_backwards(Z,X).
connected_backwards(Y,X) :- connected_forward(Y,X).

connected(X,Y) :- connected_forward(X,Y).
connected(X,Y) :- connected_backwards(X,Y).


    %%below is class example that professor said would work but isnt?
% connected_both(X,Y):- 
%     connected(X,Y).

% connected_both(X,Y):- 
%     connected(Y,X).

% connected(X,Y) :- edge(X,Y).
% connected(X,Y) :- edge(X,Z), connected(Z,Y).



natural_number(zero).
natural_number(s(X)):- 
    natural_number(X).

%we understand s/1 as a "successor" implying - in this program - that s(0) is 1,
% as it is the number immediately succeeding 0.
%above implies that all natural numbers above 0 can be proved and represented in 
% this program.
%thus something like "s(s(s(0)))" is equal to 3. 

%goal for now is to write an addition predicate (add/3) that uses these natural
% number rules to do arithmetic in prolog.

add(zero, X, X):- 
    natural_number(X).
add(s(X), Y, s(Z)):- 
    add(X,Y,Z).

even(zero).
even(s(s(X))):- even(X).

odd(s(X)):- even(X).

greaterThan(s(_),zero).
greaterThan(s(X), s(Y)):-
    greaterThan(X, Y).

select(X, [X|Tail], Tail).
select(X, [H|Tail], [H|SelectedTail]):-
    select(X, Tail, SelectedTail).

permutation([],[]).
permutation(List,[H|T]):-
    select(H, List, Remaining),
    permutation(Remaining, T).

edge(a,b).
edge(a,c).
edge(b,d).
edge(c,d).
edge(d,e).
edge(f,g).

connected(X,Y,[X,Y]):-
    edge(X,Y).

connected(X,Y,[X|Tail]):-
    edge(X,Z),
    connected(Z,Y,Tail).


suffix(List,List).
suffix(List1,[_|Ys]):-
    suffix(List1, Ys).

