testGuesses(Solution) :-
  guess(['t', 'r', 'a', 'c', 'e'], 0, 2, Solution),
  guess(['l', 'a', 'c', 'k', 's'], 0, 1, Solution),
  guess(['p', 'o', 'u', 'n', 'd'], 1, 1, Solution),
  guess(['p', 'e', 'r', 'k', 'y'], 2, 0, Solution),
  guess(['p', 'a', 'i', 'n', 't'], 1, 1, Solution),
  guess(['c', 'o', 'r', 'n', 'y'], 0, 1, Solution),
  guess(['p', 'e', 'n', 'a', 'l'], 2, 0, Solution).
  