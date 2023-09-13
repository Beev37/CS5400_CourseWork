
card(counterspell).
blue(counterspell).
isValid(X) :- card(X), hasColor(X).
hasColor(X) :- blue(X).


father(Dad, Child) :- parent(Dad, Child), male(Dad).
mother(Mom, Child) :- parent(Mom, Child), female(Mom).

sibling(Sibling1, Sibling2):-
  parent(Parent, Sibling1),
  parent(Parent, Sibling2),
  Sibling1 \= Sibling2.

brother(Brother, Sib) :-
  sibling(Brother, Sib),
  male(Brother).

sister(Sister, Sib) :-
  sibling(Sister, Sib),
  female(Sister).