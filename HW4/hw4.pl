% Exercise 1: substitute(X, Y, L1, L2)

substitute(_, _, [], []).
substitute(X, Y, [X|T1], [Y|T2]):-
    substitute(X, Y, T1, T2).
substitute(X, Y, [H|T1], [H|T2]):-
    X \= H,
    substitute(X, Y, T1, T2).

%_______________________________________________________________________________
% Exercise 2: adjacent(X, Y, Zs)

%____1st attempt____
% doesn't handle cases where there are duplicates:
% ex: adjacent(a, b, [a, b, a, c, d]) --> false
% adjacent(_, _, []).
% adjacent(X, Y, [X, Y | T]):-
%     adjacent(X, Y, T).
% adjacent(X, Y, [Y, X | T]):-
%     adjacent(X, Y, T).
% adjacent(X, Y, [H|T]):-
%     X \= H, Y \= H,
%     adjacent(X, Y, T).

%____2nd attempt____
adjacent(X, Y, [X, Y | _]).
adjacent(X, Y, [Y, X | _]).
adjacent(X, Y, [_ | T]):-
    adjacent(X, Y, T).

%_______________________________________________________________________________
% Exercise 3: The International Neighborhood Hobbyists Puzzle

% ____1st attempt____
% /* 
% house(position, color) --> positioning: LeftSide [1, 2, 3, 4, 5] RightSide
% person(X, trait)
% traits:
%     nationality(nation)
%     listensTo(music)
%     enjoys(hobby)
%     likes(food)
%     livesIn(house(color))
% */
% %The Irish person lives next to the yellow house.
% livesNextdoor(person(_, nationality(irish)), house(_, yellow)).

% %The person who likes donuts lives next to the person who enjoys embroidery.
% livesNextdoor(person(A, likes(donuts)), person(B, enjoys(embroidery))):-
%     A\=B.

% %The person who enjoys train spotting lives next to the one who likes pizza.
% livesNextdoor(person(A, enjoys(trainSpotting)), person(B, likes(pizza))):-
%     A\=B.

% %The person who enjoys pachinko likes beets.
% person(A, enjoys(pachinko)):-
%     person(A, likes(beets)).

% %The Czech lives in the purple house.
% person(A, nationality(czech)):-
%     person(A, livesIn(_, purple)).

% %The person living in the center house listens to grunge.
% person(A, livesIn(3, _)):-
%     person(A, listensTo(grunge)).

% %The person who enjoys glassblowing listens to hip hop.
% person(A, enjoys(glassblowing)):-
%     person(A, listensTo(hiphop)).

% %The American likes tofu.
% person(A, nationality(american)):-
%     person(A, likes(tofu)).

% %The Dutch person listens to J-Pop.
% person(A, nationality(dutch)):-
%     person(A, listensTo(jpop)).

% %The pink house's owner listens to country.
% person(A, livesIn(house(_, pink))):-
%     person(A, listensTo(country)).

% %The owner of the green house enjoys embroidery.
% person(A, livesIn(house(_, green))):-
%     person(A, enjoys(embroidery)).

% %The Irish person lives in the first (leftmost) house.
% person(A, nationality(irish)):-
%     person(A, livesIn(1, _)).

% %The pink house is on the left of the orange house.
% livesNextdoor(house(X, pink), house(Y, orange)):-
%     1 is Y - X.

% %The Japanese person enjoys gardening.
% person(A, nationality(japanese)):-
%     person(A, enjoys(gardening)).

% %The person who enjoys train spotting has a next-door neighbor who listens to jazz.
% livesNextdoor(person(A, enjoys(trainSpotting)), person(B, listensTo(jazz))):-
%     A\=B.


%_____2nd Attempt:_____
%format: house(1-id, 2-nextTo, 3-nationality, 4-music, 5-hobby, 6-food, 7-houseColor)

% %The Irish person lives next to the yellow house.
% house(_, X, irish, _, _, _, _):-
%     X = house(_, _, _, _, _, _, _, yellow).

% %The person who likes donuts lives next to the person who enjoys embroidery.
% house(_, X, _, _, _, donuts, _):-
%     X = house(_, _, _, _, _, embroidery, _, _).

% %The person who enjoys train spotting lives next to the one who likes pizza.
% house(_, X, _, _, _, trainSpotting, _):-
%     X = house(_, _, _, _, _, pizza, _).

% %The person who enjoys pachinko likes beets.
% house(_, _, _, _, pachinko, beets, _).

% %The Czech lives in the purple house.
% house(_, _, czech, _, _, _, purple).

% %The person living in the center house listens to grunge.
% house(3, _, _, grunge, _, _, _).

% %The person who enjoys glassblowing listens to hip hop.
% house(_, _, _, hiphop, glassblowing, _, _).

% %The American likes tofu.
% house(_, _, american, _, _, tofu, _).

% %The Dutch person listens to J-Pop.
% house(_, _, dutch, jpop, _, _, _).

% %The pink house's owner listens to country.
% house(_, _, _, country, _, _, pink).

% %The owner of the green house enjoys embroidery.
% house(_, _, _, _, embroidery, _, green).

% %The Irish person lives in the first (leftmost) house.
% house(1, _, irish, _, _, _, _).

% %The pink house is on the left of the orange house.
% house(A, X, _, _, _, _, pink):-
%     X = house(B, _, _, _, _, _, orange),
%     1 is abs(A-B).

% %The Japanese person enjoys gardening.
% house(_, _, japanese, _, gardening, _, _).


% %The person who enjoys train spotting has a next-door neighbor who listens to jazz.
% house(_, X, _, _, trainSpotting, _, _):-
%     X = house(_, _, _, jazz, _, _, _).

% %Someone likes pie
% house(_, _, _, _, _, pie, _).


% % pie_eater(X):-
% %     pie_eater(X, 1).

% % pie_eater([], 5).
% % pie_eater([H|T], ID):-
% %     H = house(ID, _, _, _, _, _, _),
% %     NewID is ID+1,
% %     pie_eater(T, NewID).

%____3rd attempt:____
/*
Citation: https://stackoverflow.com/questions/48919392/solving-puzzle-using-constraints-and-permutations-in-prolog
*/

left_of(X, Y, [X, Y|_]).
left_of(X, Y, [_|T]):-
    left_of(X,Y,T).


pie_eater(Eater):-
    solve(X),
    member(house(Eater, _, _, pie, _), X).

solve(X):-
    X = [H1, H2, H3, H4, H5],

    H1 = house(Nat1, Mus1, Hob1, Food1, Color1),
    H2 = house(Nat2, Mus2, Hob2, Food2, Color2),
    H3 = house(Nat3, Mus3, Hob3, Food3, Color3),
    H4 = house(Nat4, Mus4, Hob4, Food4, Color4),
    H5 = house(Nat5, Mus5, Hob5, Food5, Color5),

    % The Irish person lives next to the yellow house.
    adjacent(house(irish, _, _, _, _), house(_, _, _, _, yellow), X),
    
    % The person who likes donuts lives next to the person who enjoys embroidery.
    adjacent(house(_, _, _, donuts, _), house(_, _, embroidery, _, _), X),
    
    % The person who enjoys train spotting lives next to the one who likes pizza.
    adjacent(house(_, _, trainspotting, _, _), house(_, _, _, pizza, _), X),
    
    % The person who enjoys pachinko likes beets.
    member(house(_, _, pachinko, beets, _), X),
    
    % The Czech lives in the purple house.
    member(house(czech, _, _, _, purple), X),
    
    % The person living in the center house listens to grunge.
    X = [_, _, house(_, grunge, _, _, _), _, _],
    
    % The person who enjoys glassblowing listens to hip hop.
    member(house(_, hiphop, glassblowing, _, _), X),
    
    % The American likes tofu.
    member(house(american, _, _, tofu, _), X),
    
    % The Dutch person listens to J-Pop.
    member(house(dutch, jpop, _, _, _), X),
    
    % The pink house's owner listens to country.
    member(house(_, country, _, _, pink), X),
    
    % The owner of the green house enjoys embroidery.
    member(house(_, _, embroidery, _, green), X),
    
    % The Irish person lives in the first (leftmost) house.
    X = [house(irish, _, _, _, _), _, _, _, _],
    
    % The pink house is on the left of the orange house.
    left_of(house(_, _, _, _, pink), house(_, _, _, _, orange), X),
    
    % The Japanese person enjoys gardening.
    member(house(japanese, _, gardening, _, _), X),
    
    % The person who enjoys train spotting has a next-door neighbor who listens to jazz.
    adjacent(house(_, _, trainspotting, _, _), house(_, jazz, _, _, _), X), 

    % Someone loves pie.
    member(house(_, _, _, pie, _), X),

    permutation([american, czech, dutch, irish, japanese], [Nat1, Nat2, Nat3, Nat4, Nat5]),
    permutation([country, grunge, hiphop, jazz, jpop], [Mus1, Mus2, Mus3, Mus4, Mus5]),
    permutation([green, orange, pink, purple, yellow], [Color1, Color2, Color3, Color4, Color5]),
    permutation([embroidery, gardening, glassblowing, pachinko, trainspotting], [Hob1, Hob2, Hob3, Hob4, Hob5]),
    permutation([beets, donuts, pie, pizza, tofu], [Food1, Food2, Food3, Food4, Food5]).