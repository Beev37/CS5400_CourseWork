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

test1:-
  ['testNet1.pl'],
  red_edge_sequence([b,d,f,h,k]),
  red_edge_sequence([b,d,f,h,i,k]),
  red_edge_sequence([b,d,i,k]).

red_edge_sequence([H|[]]):-
  end_state(H).

red_edge_sequence([H1, H2|T]):-
  trans(H1, H2, red),
  red_edge_sequence([H2|T]).

% alternating_edge_sequence/1

test2:-
  ['testNet1.pl'],
  alternating_edge_sequence([b,d,f,h,j]),
  alternating_edge_sequence([a,f,h,j]),
  alternating_edge_sequence([a,d,f,g,j]),
  alternating_edge_sequence([a,d,e,i,k]),
  alternating_edge_sequence([b,d,f,g,j]),
  alternating_edge_sequence([b,d,e,i,k]).

alternating_edge_sequence(List):-
  (
    alt_edge_seq(List, green)
    ;
    alt_edge_seq(List, red)
  ).

alt_edge_seq([H|[]], _):-
  end_state(H).

alt_edge_seq([H1, H2|T], Color):-
  (Color = red -> X = green ; X = red),
  trans(H1, H2, Color),
  alt_edge_seq([H2|T], X).


% matching_edge_state_sequence/1

test3:-
  ['testNet1.pl'],
  matching_edge_state_sequence([a,f,g,h,j]),
  matching_edge_state_sequence([b,d,i,k]).

matching_edge_state_sequence(List):-
  (
    mtch_edg_stt_seq(List, red)
    ;
    mtch_edg_stt_seq(List, green)
  ).

mtch_edg_stt_seq([H|[]], _):-
  end_state(H).

mtch_edg_stt_seq([H1, H2|T], Color):-
  state(H1, Color),
  state(H2, Color),
  trans(H1, H2, Color),
  mtch_edg_stt_seq([H2|T], Color).


% END CHANGES