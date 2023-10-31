testGuesses(Solution) :-
  guess(['p', 'e', 'a', 'c', 'e'], 1, 1, Solution),
  guess(['r', 'o', 'u', 'n', 'd'], 1, 0, Solution),
  guess(['t', 'i', 'n', 'e', 's'], 0, 3, Solution),
  guess(['b', 'r', 'i', 'n', 'e'], 1, 0, Solution),
  guess(['r', 'a', 'p', 'i', 'd'], 1, 0, Solution).