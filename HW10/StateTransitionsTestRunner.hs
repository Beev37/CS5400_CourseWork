-- You don't need to change anything in this file.
-- Write all your code in StateTransitions.hs, then
-- load this file and call `main`

import StateTransitions

-- In order to print out the solution we need to make use fo the IO monad.
main :: IO ()
main = do
  putStrLn "Test Network 1:"
  showSolution testNetwork1 -- Call showSolution on the first network
  putStrLn "Test Network 2:"
  showSolution testNetwork2 -- Call showSolution on the second network

-- We take the network as an argument and call the required functions
showSolution :: Network -> IO ()
showSolution nw =
  do
    putStrLn "Red edge sequences:"
    let reds = red_edge_sequence nw -- produces red edge sequences
    print reds
    putStrLn "Alternating edge sequences:"
    let alts = alternating_edge_sequence nw -- produces alternating edge sequences
    print alts
    putStrLn "Matching edge/state sequences:"
    let matches = matching_edge_state_sequence nw -- produces matching state/edge sequences
    print matches
    putStr "\n"

-- DATA:
-- Below two test networks are defined which correspond to the graphs shown on
-- the assignment page. The networks are refered to by name in the main function
-- call, but not anywhere else.
-- =============================================================================
testNetwork1 :: Network
testNetwork1 = (
     [('A', Green), ('B', Red)], -- starts
     [('J', Green), ('K', Red)], -- finals
     [
       ('A', Green), ('B', Red), ('C', Red), ('D', Red),        --
       ('E', Green), ('F', Green), ('G', Green), ('H', Green),  -- states
       ('I', Red), ('J', Green), ('K', Red)                     --
     ],
     [
       ('A', Green, 'C'), ('A', Green, 'F'), ('A', Green, 'D'),             --
       ('B', Green, 'D'), ('B', Red, 'D'),                                  --
       ('D', Red, 'F'), ('D', Green, 'F'),('D', Red, 'E'), ('D', Red, 'I'), --
       ('F', Green, 'G'), ('F', Red, 'H'),                                  --
       ('E', Green, 'I'),                                                   -- transitions
       ('G', Green, 'H'), ('G', Red, 'J'),                                  --
       ('H', Green, 'J'), ('H', Red, 'K'), ('H', Red, 'I'),                 --
       ('I', Red, 'K')                                                      --
     ]
   )
-- Expected outcome for this network
-- Red edge sequences:
-- ["BDIK","BDFHK","BDFHIK"]
-- Alternating edge sequences:
-- ["AFHJ","ADFGJ","ADEIK","BDFGJ","BDEIK","BDFHJ"]
-- Matching edge/state sequences:
-- ["AFGHJ","BDIK"]

testNetwork2 :: Network
testNetwork2 = (
     [('A', Green), ('B', Red)],
     [('K', Green), ('L', Red)],
     [
       ('A', Green), ('B', Red), ('C', Red), ('D', Red),
       ('E', Green), ('F', Green), ('G', Green), ('H', Green),
       ('I', Green), ('J', Red), ('K', Green), ('L', Red)
     ],
     [
       ('A', Red, 'C'), ('A', Green, 'F'), ('A', Green, 'D'),
       ('B', Green, 'D'), ('B', Red, 'D'),
       ('C', Red, 'F'),
       ('D', Red, 'E'), ('D', Red, 'G'), ('D', Green, 'F'),
       ('G', Red, 'I'),
       ('F', Red, 'H'), ('F', Green, 'I'),
       ('E', Green, 'J'),
       ('H', Green, 'I'), ('H', Red, 'K'),
       ('I', Green, 'K'), ('I', Red, 'L'), ('I', Red, 'J'),
       ('J', Red, 'L')
     ]
   )
-- Expected outcome for this network
-- Red edge sequences:
-- ["ACFHK","BDGIL","BDGIJL"]
-- Alternating edge sequences:
-- ["AFHIL","ADEJL","BDEJL","BDFHIL"]
-- Matching edge/state sequences:
-- ["AFIK"]

-- ([('A', Green), ('B', Red)],[('J', Green), ('K', Red)],[('A', Green), ('B', Red), ('C', Red), ('D', Red),('E', Green), ('F', Green), ('G', Green), ('H', Green),('I', Red), ('J', Green), ('K', Red)],[('A', Green, 'C'), ('A', Green, 'F'), ('A', Green, 'D'),('B', Green, 'D'), ('B', Red, 'D'),('D', Red, 'F'), ('D', Green, 'F'),('D', Red, 'E'), ('D', Red, 'I'),('F', Green, 'G'), ('F', Red, 'H'),('E', Green, 'I'),('G', Green, 'H'), ('G', Red, 'J'),('H', Green, 'J'), ('H', Red, 'K'), ('H', Red, 'I'),('I', Red, 'K')])