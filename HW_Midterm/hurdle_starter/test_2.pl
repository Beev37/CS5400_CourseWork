testGuesses(Solution) :-
  guess(['s', 'c', 'a', 'r', 'e'], 1, 0, Solution),
  guess(['s', 'o', 'u', 'p', 'y'], 0, 1, Solution),
  guess(['b', 'r', 'i', 'n', 'e'], 1, 0, Solution),
  guess(['e', 'm', 'o', 't', 'e'], 1, 0, Solution),
  guess(['v', 'e', 'n', 'u', 'e'], 2, 0, Solution).