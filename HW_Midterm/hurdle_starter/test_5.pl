testGuesses(Solution) :-
  guess(['c', 'r', 'a', 't', 'e'], 0, 2, Solution),
  guess(['b', 'l', 'o', 'a', 't'], 0, 1, Solution),
  guess(['h', 'o', 'i', 's', 't'], 0, 1, Solution),
  guess(['t', 'a', 's', 'e', 'r'], 2, 0, Solution),
  guess(['f', 'a', 't', 'e', 'd'], 1, 0, Solution),
  guess(['c', 'a', 'g', 'e', 'y'], 1, 0, Solution),
  guess(['m', 'o', 't', 'o', 'r'], 1, 1, Solution).