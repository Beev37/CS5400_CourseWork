% A solver for the Hurdle word game
% https://playhurdle.vercel.app/

:-['wordlist'].

main(Filename) :-
  % Filename is a test file name in quotes
  load(Filename),
  findall(Solution, solve(Solution), Sols),
  sort(Sols, SortedSols),
  writeOut(SortedSols).

  % TODO:
  % Generate candidates from the wordlist
  % and use the test file to test whether they
  % meet all the criteria to be correct
  % solutions. Use imported predicates
  % word/1, testGuesses/1, and define
  % guess/4 such that it constrains the
  % possible solutions appropriately.
  % You may define as many other predicates
  % as you need.
solve(Solution) :-
  word(Solution),
  testGuesses(Solution).


correctSpots([], 0, []).
correctSpots([H|T1], SameSpots, [H|T2]):-
  X is SameSpots - 1,
  correctSpots(T1, X, T2).
correctSpots([H1|T1], SameSpots, [H2|T2]):-
  H1\=H2,
  correctSpots(T1, SameSpots, T2).


correctNumber([], 0, 5, _):- !.
correctNumber([CH|CT], RightLetter, Index, Solution):-
  memberOutOfIndex(CH, Index, Solution),
  X is RightLetter - 1,
  Y is Index + 1,
  correctNumber(CT, X, Y, Solution).
correctNumber([_|CT], RightLetter, Index, Solution):-
  Y is Index + 1,
  correctNumber(CT, RightLetter, Y, Solution).

memberOutOfIndex(Char, Index, Solution):-
  letterToSplitWith(Index, Solution, SpLetter),
  append(Before, [SpLetter|_], Solution),
  member(Char, Before), !.

memberOutOfIndex(Char, Index, Solution):-
  letterToSplitWith(Index, Solution, SpLetter),
  append(_, [SpLetter|After], Solution),
  member(Char, After), !.

letterToSplitWith(0, [SolH|_], SolH):- !.
letterToSplitWith(Index, [_|SolT], SplitLetter):-
  Index > 0,
  Y is Index - 1,
  letterToSplitWith(Y, SolT, SplitLetter), !.


guess(ClueWord, RightSpot, RightLetter, GuessWord):-
  correctSpots(ClueWord, RightSpot, GuessWord),
  correctNumber(ClueWord, RightLetter, 0, GuessWord). %wrong output when there are no letters in the wrong spot




% Utility predicates
% You won't need to modify anything
% below this point, but you should
% read it and make sure you understand
% what it all does.

% Write out solutions
writeOut([]) :-
  write('No more solutions found.').
writeOut([Solution|Rest]) :-
  write("Possible solution: '"),
  writeOut_(Solution),
  write("'"), nl,
  writeOut(Rest).

writeOut_([]).
writeOut_([Letter|Rest]) :-
  write(Letter),
  writeOut_(Rest).

% Declare testGuesses/1 to be dynamic to
% suppress a "redefined" warning. 
:- dynamic testGuesses/1.
% Consult the file and check that
% the expected predicates are defined
% (You'll need to define guess/4 yourself)
load(Filename) :-
  [Filename],
  current_predicate(word/1),
  current_predicate(testGuesses/1),
  current_predicate(guess/4).