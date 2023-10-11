% sublist([c,d], [a,b,c,d,e]) --> true.

% prefix(X, X).
% prefix([H|T1], [H|T2]):-


% suffix(_, []).
% suffix()

my_append([], Ys, Ys).
my_append([X|Xs], Ys, [X|Zs]):-
    my_append(Xs, Ys, Zs).

sublist(List1, List2):-
    my_append(_, Suffix, List2),
    my_append(List1, _, Suffix).

sublist2(List1, List2):-
    prefix(List1, List3),
    suffix(List3, List2).

sublist3(List1, List2):-
    append([_, List1, _], List2).

%sum_list([2, 4, 6], Sum). --> Sum = 12.

% traditional recursion example
sum_list([], 0).
sum_list([H|T], Sum):-
    sum_list(T, Tsum), %Tsum -- not Sum. Needs to be different bc they are diff sums.
    Sum is H + Tsum.

% tail recursion example
sum_list_tr(List, Sum):-
    sum_list_tr(List, 0, Sum).

sum_list_tr([], X, X).
sum_list_tr([H|T], Acc, Sum):-
    X is Acc + H,
    sum_list_tr(T, X, Sum).


% list_len([2, 4, 6] Len). --> Len = 3.

list_len(List, Len):-
    list_len(List, 0, Len).

list_len([], X, X).
list_len([_|T], Acc, Len):-
    X is Acc + 1,
    list_len(T, X, Len).


reverse1([],[]).
reverse1([X|Xs], R):-
    reverse1(Xs, Rs),
    append(Rs, [X], R).

reverse2(L, R):-
    reverse2(L, [], R).
reverse2([], R, R).
reverse2([X|Xs], Acc, R):-
    reverse2(Xs, [X|Acc], R).



dog(shepherd).
dog(labrador).
dog(poodle).
dog(pitbull).

bird(pigeon).
bird(chicken).
bird(hawk).
bird(bluejay).

animal_counts(List, X):-
    animal_counts(List, 0, 0, X).

animal_counts([], Dogs, Birds, count(dogs: Dogs, birds: Birds)).
animal_counts([H|T], Dogs, Birds, X):-
    dog(H),
    D is Dogs+1,
    animal_counts(T, D, Birds, X).
animal_counts([H|T], Dogs, Birds, X):-
    bird(H),
    B is Birds+1,
    animal_counts(T, Dogs, B, X).


% animal_counts2([], count(dogs: 0, birds: 0)).
% animal_counts2([H|T], count(Dogs, Birds)):-
%     dog(H),
%     animal_counts2(T, count(dogs: D, Birds)),
%     D is Dogs + 1.
% animal_counts2([H|T], count(Dogs, Birds)):-
%     bird(H),
%     animal_counts2(T, count(Dogs, birds: B)),
%     B is Birds + 1.