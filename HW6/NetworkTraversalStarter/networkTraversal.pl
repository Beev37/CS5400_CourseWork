% Red/green state transition network
% Your solution should be general and work for 
% similar red/green state transition networks with differing
% structures. Knowledge of the specific structure of the 
% network should be contained in a knowledge base of facts. 

% This predicate tests all three predicates. The argument is 
% the name of the file containing the specific test network you 
% wish to test. See the comments in the test network files to see
% what solutions should be returned.
test(TestNetFileName) :-
  [TestNetFileName],
  write("Red edge sequences:"), nl,
  bagof(X, red_edge_sequence(X), Xs),
  writeOut(Xs), nl,
  write("Alternating edge sequences:"), nl,
  bagof(Y, alternating_edge_sequence(Y), Ys),
  writeOut(Ys), nl,
  write("Matching edge/state sequences:"), nl,
  bagof(Z, matching_edge_state_sequence(Z), Zs),
  writeOut(Zs), nl.
  
writeOut([]).
writeOut([H|T]) :-
  write(H), nl,
  writeOut(T). 

% You must define the following predicates. You'll need to define
% other helper predicates as well
% BEGIN CHANGES

% red_edge_sequence/1
% state(a, green).
% state(b, red).
% state(c, red).
% state(d, red).
% state(e, green).
% state(f, green).
% state(g, green).
% state(h, green).
% state(i, green).
% state(j, red).
% state(k, green).
% state(l, red).

% test1:-
%   red_edge_sequence([a,c,f,h,k]).

% red_edge_sequence([H|T]):-
%   state(H, red),
%   red_edge_sequence(T).

% alternating_edge_sequence/1

% matching_edge_state_sequence/1

% END CHANGES