/* Chpt. 1: (1.1-1.5)

Exercise  1.1 Which of the following sequences of characters are atoms, which are variables, and which are neither?

    vINCENT                 - atom
    Footmassage             - variable 
    variable23              - atom
    Variable2000            - variable
    big_kahuna_burger       - atom
    ’big  kahuna  burger’   - atom
    big  kahuna  burger     - neither
    ’Jules’                 - atom
    _Jules                  - variable
    ’_Jules’                - atom

Exercise  1.2 Which of the following sequences of characters are atoms, which are variables, which are complex terms, and which are not terms at all? 
Give the functor and arity of each complex term.

    loves(Vincent,mia)                  - complex term [functor=loves; arity=2]
    ’loves(Vincent,mia)’                - atom
    Butch(boxer)                        - neither (because the functor is not a valid atom)
    boxer(Butch)                        - complex term [functor=boxer; arity=1]
    and(big(burger),kahuna(burger))     - complex term [functor=and; arity=2]
    and(big(X),kahuna(X))               - complex term [functor=and; arity=2]
    _and(big(X),kahuna(X))              - neither (because the functor is not a valid atom)
    (Butch  kills  Vincent)             - neither (because of the lack of a functor)
    kills(Butch  Vincent)               - neither (because the lack of a comma separating the arguments)
    kills(Butch,Vincent                 - neither (because of the typo [forgetting the closing parentheses])

Exercise  1.3 How many facts, rules, clauses, and predicates are there in the following knowledge base? 
What are the heads of the rules, and what are the goals they contain?

   woman(vincent).                          - fact 
   woman(mia).                              - fact
   man(jules).                              - fact
   person(X):-  man(X);  woman(X).          - rule
   loves(X,Y):-  father(X,Y).               - rule
   father(Y,Z):-  man(Y),  son(Z,Y).        - rule
   father(Y,Z):-  man(Y),  daughter(Z,Y).   - rule

   - In this knowledge base, there are:
        - Facts:        3x
        - Rules:        4x
        - Clauses:      7x
        - Predicates:   7x (woman, man, person, loves, father, son, daughter)
        - Rule Heads:   person(x), loves(X,Y), father(Y,Z)
        - Rule Goals:   man(X), woman(X), father(X,Y), son(Z,Y), daughter(Z,Y)

Exercise  1.4 Represent the following in Prolog:

    Butch is a killer.                                      - killer(butch).
    Mia and Marsellus are married.                          - married(mia, marsellus).
    Zed is dead.                                            - dead(zed).
    Marsellus kills everyone who gives Mia a footmassage.   - kills(marsellus,X) :- footMassage(X,mia).
    Mia loves everyone who is a good dancer.                - loves(mia,X) :- goodDancer(X).
    Jules eats anything that is nutritious or tasty.        - eats(jules, food) :- nutritious(food); tasty(food).

Exercise  1.5 Suppose we are working with the following knowledge base:

   wizard(ron).
   hasWand(harry).
   quidditchPlayer(harry).
   wizard(X):-  hasBroom(X),  hasWand(X).
   hasBroom(X):-  quidditchPlayer(X).

How does Prolog respond to the following queries?

    wizard(ron).        - True
    witch(ron).         - False
    wizard(hermione).   - False
    witch(hermione).    - False (Error message - unknown procedure)
    wizard(harry).      - True
    wizard(Y).          - (Y=ron; Y=harry)
    witch(Y).           - False (Error message - unknown procedure)


_______________________________________________________________________________


Chpt. 2: (2.1 & 2.2)

Exercise  2.1 Which of the following pairs of terms unify? 
                Where relevant, give the variable instantiations that lead to successful unification.

    bread  =  bread                                 - unify
    ’Bread’  =  bread                               - doesn't unify
    ’bread’  =  bread                               - unify
    Bread  =  bread                                 - doesn't unify
    bread  =  sausage                               - doesn't unify
    food(bread)  =  bread                           - doesn't unify
    food(bread)  =  X                               - unify \\ X = food(bread)
    food(X)  =  food(bread)                         - unify \\ X = bread
    food(bread,X)  =  food(Y,sausage)               - unify \\ X = sausage, Y = bread
    food(bread,X,beer)  =  food(Y,sausage,X)        - doesn't unify
    food(bread,X,beer)  =  food(Y,kahuna_burger)    - doesn't unify
    food(X)  =  X                                   - doesn't unify
    meal(food(bread),drink(beer))  =  meal(X,Y)     - unify \\ X = food(bread), Y = drink(beer)
    meal(food(bread),X)  =  meal(X,drink(beer))     - doesn't unify

Exercise  2.2 We are working with the following knowledge base:
   house_elf(dobby).
   witch(hermione).
   witch(’McGonagall’).
   witch(rita_skeeter).
   magic(X):-  house_elf(X).
   magic(X):-  wizard(X).
   magic(X):-  witch(X).

Which of the following queries are satisfied? Where relevant, give all the variable instantiations that lead to success.

    ?-  magic(house_elf).       - Can't be satisfied - because the argument passed inside can't be unified, as there is no atom to unify house_elf
    ?-  wizard(harry).          - Can't be satisfied - because there is no clause that matches the functor: wizard()
    ?-  magic(wizard).          - Can't be satisfied - because the argument passed inside can't be unified, as there is no atom to unify wizard 
    ?-  magic(’McGonagall’).    - Can be satisfied - given the property: 'atom' = atom; we can unify magic('McGonagall'). Prolog looks at the query and finds the rule magic(X) :- witch(X) [after trying house_elf(X) & wizard(X)]. It then tries to satisfy witch(X) where X = 'McGonagall' - which it can do!
    ?-  magic(Hermione).        - Can be satisfied - because the argument passed to magic() is a variable, the result will be a sequence of all things that can satisfy the query.
                                                   - Hermione = dobby; hermione; 'McGonagall'; rita_skeeter

Draw the search tree for the query magic(Hermione) .

?- magic(Hermione)
    - abstract Hermione to _G34
    - tries to find clause in KB that matches magic --> finds a rule magic(X) [line 105] and instantiates --> add the goal of the rule, house_elf(_G34), to Prolog's stack
    - tries to unify the goal house_elf(_G34) --> finds satisfying clause [line 101] and unifies
    - returns Hermione = dobby to user
?- ;
    - backtracks to choice point described at line 123
    - tries to unify the goal house_elf(_G34) --> can't find anymore matching functors --> backtracks to earlier choice point described at line 122
    - tries to find clause in KB that matches magic --> finds a rule magic(X) [line 106] and instantiates --> add the goal of the rule, wizard(_G34), to Prolog's stack
    - tries to unify the goal wizard(_G34) --> can't find any matching functors --> backtracks to earlier choice point described at line 127
    - tries to find clause in KB that matches magic --> finds a rule magic(X) [line 107] and instatiates --> add the goal of the rule, witch(_G34), to Prolog's stack
    - tries to unify the goal witch(_G34) --> finds satisfying clause [line 102] and unifies
    - returns Hermione = hermione to user
?- ;
    - backtracks to choice point described at line 131
    - tries to unify the goal witch(_G34) --> finds satisfying clause [line 103] and unifies
    - returns Hermione = 'McGonagall' to user
?- ;
    - backtracks to choice point described at line 135
    - tries to unify the goal witch(_G34) --> finds satisfying clause [line 104] and unifies
    - returns Hermione = rita_skeeter to user
?- ;
    - backtracks to choice point described at line 139
    - tries to unify the goal witch(_G34) --> can't find anymore matching functors --> algorithm terminates as there are no more matching clauses and the stack is empty
    - returns false to user as termination

Coding Portion HW1: */

female(marge).
female(june).
female(maggie).
female(lisa).
female(mary).
female(jenny).
female(kate).

male(homer).
male(ward).
male(wally).
male(ted).
male(tim).
male(tom).

spouse(marge, homer).
spouse(june, ward).
spouse(lisa, wally).
spouse(mary, ted).

parent(marge, maggie).
parent(homer, maggie).
parent(marge, lisa).
parent(homer, lisa).
parent(june, wally).
parent(ward, wally).
parent(june, ted).
parent(ward, ted).
parent(lisa, jenny).
parent(wally, jenny).
parent(lisa, kate).
parent(wally, kate).
parent(ted, tim).
parent(mary, tim).
parent(ted, tom).
parent(mary, tom).

mother_in_law(Mother, Person) :-
  female(Mother),
  parent(Mother, Spouse),
  (spouse(Spouse, Person); spouse(Person, Spouse)).

daughter_in_law(Daughter, Person) :-
  female(Daughter),
  parent(Person, Spouse),
  (spouse(Spouse, Daughter); spouse(Daughter, Spouse)).

/* a partner's brother */
brother_in_law(Brother, Person) :-
  male(Brother),
  brother(Brother, Spouse),
  (spouse(Spouse, Person); spouse(Person, Spouse)).

/* a sibling's husband */
brother_in_law(Brother, Person) :-
  male(Brother),
  sibling(Person, Sibling),
  (spouse(Brother, Sibling); spouse(Sibling, Brother)).


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