import Data.Char (digitToInt)
import Data.List (tails)

-- Exercise 1: Write a function that generates combinations of K distinct objects chosen from N elements of a list. Consider the different ways a committee of 3 people could be drawn from a group of 12 people. The function should take a list and return a list of lists. 
-- Structure: 'combinations :: Int -> [a] -> [[a]]
-- The 'combinations' function can be written as a recursive list comprehension using the 'tails' function. You can use pattern matching to define a base case for when k is equal to 0. 


-- had to look up solution :( 
-- https://wiki.haskell.org/99_questions/Solutions/26




combinations :: Int -> [a] -> [[a]]
combinations 0 _ = [[]]
combinations n xs = [y:ys | y:xs' <- tails xs, ys <- combinations (n-1) xs']

-- Me trying to understand the recusion
-- comb 2 [1,2,3] = [y:ys | y:xs' <- tails [1,2,3], ys <- [[2], [3]]]
-- comb 1 [2,3] = [y:[[]] | y:xs' <- tails [2,3], ys <- [[]]]
-- comb 0 [3] = [[]]



-- Exercise 2: Using foldl, define a function 'dec2int :: [Int] -> Int' that takes a list of single digit integers and returns the integer made up of the digits in the decimal place that corresponds to their position in the list. 
-- Ex: 'dec2int [5,4,2,6,1] --output--> 54621
-- Note that this exercise uses foldl instead of foldr. This is an example where foldl is a much more natural choice than foldr. Consider why

dec2int :: [Int] -> Int
dec2int = foldl (\x y -> 10*x+y) 0 


-- Exercise 3: Generalizing from the previous exercise, write a function base2int :: Int -> String -> Int that takes an argument representing a base and a string representing a number in that base, and returns an integer representing the decimal number expressed by the string.
-- base2int 2 "10111" --output--> 23
-- Note that this exercise differs from Exercise ? in that the argument determines the base and also in that the function is expected to work on a string rather than a list of numbers. You may want to use digitToInt from the Data.Char library to help with this. You may define helper functions if it's easier or clearer than doing everything inline.

base2int :: Int -> String -> Int


