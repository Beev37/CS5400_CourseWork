testGuesses(Solution) :-
  guess(['t', 'r', 'a', 'c', 'e'], 0, 2, Solution),
  guess(['l', 'a', 'c', 'k', 's'], 0, 1, Solution),
  guess(['p', 'o', 'u', 'n', 'd'], 1, 1, Solution),
  guess(['p', 'e', 'r', 'k', 'y'], 2, 0, Solution).