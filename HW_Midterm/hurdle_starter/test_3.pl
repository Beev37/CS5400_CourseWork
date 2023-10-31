testGuesses(Solution) :-
  guess(['a', 'c', 'r', 'e', 's'], 0, 1, Solution),
  guess(['p', 'o', 'u', 'n', 'd'], 0, 1, Solution),
  guess(['s', 'l', 'i', 'm', 'e'], 0, 0, Solution),
  guess(['e', 'd', 'i', 'c', 't'], 0, 1, Solution),
  guess(['c', 'a', 'u', 'l', 'k'], 1, 0, Solution),
  guess(['b', 'a', 'w', 'd', 'y'], 1, 1, Solution),
  guess(['d', 'a', 't', 'e', 'd'], 1, 1, Solution).