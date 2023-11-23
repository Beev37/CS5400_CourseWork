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
-- Note that this exercise differs from Exercise 2 in that the argument determines the base and also in that the function is expected to work on a string rather than a list of numbers. You may want to use digitToInt from the Data.Char library to help with this. You may define helper functions if it's easier or clearer than doing everything inline.

base2int :: Int -> String -> Int
base2int b = foldl (\x y -> b*x+ digitToInt y) 0

-- Exercise 4: Modify the Caesar cipher program to also handle upper-case letters. You should assume that the distribution of upper case letters is identical to the corresponding distribution of lower-case letters (i.e 'A' has the same probability as 'a'). Capital letters will be encoded analogously to their lower-case equivalents. Thus if 'h' is encoded as 'm' (as in the example below) 'H' will be encoded as 'M'.

-- Changes made in 'Caesar_cipher.hs' file


-- Exercise 5: Declare a data type 'Tree as follows:
data Tree = Leaf Int | Node Tree Int Tree
--  Tree = Leaf structure | node leftChild nodeValue rightChild
-- Write a function 'sumtree' that traverses the tree and returns the sum of the integer values of its nodes. For example, a call to 'sumtree' with a tree with three leaves and two non-terminal nodes with the following values:
        -- Tree:
        --     5
        -- 5       2
        --       5   3
-- should result in the output '20', as shown:
-- i> sumtree (Node (Leaf 5) 5 (Node (Leaf 5) 2 (Laf 3)))
-- o> 20

sumtree :: Tree -> Int
sumtree (Leaf n) = n
sumtree (Node lc n rc) = sumtree lc + sumtree rc + n


-- Exercise 6: Declare a data type 'Tree2' as follows:
data Tree2 = Leaf2 Int | Node2 Tree2 Tree2
-- Consider the tree to be balanced if the number of leaves in the left and right subtree of every node differs by at most one, with leaves themselves being trivially balanced. Define a function 
-- 'balanced :: Tree2 -> Bool' that decides if a tree is balanced or not. Hint: first define a function that returns the number of leaves in a tree.

balanced :: Tree2 -> Bool
balanced (Leaf2 _) = True
balanced (Node2 lc rc)
        | abs (countLeaves lc - countLeaves rc) > 1 = False
        | otherwise = True

countLeaves :: Tree2 -> Int
countLeaves (Leaf2 _) = 1
countLeaves (Node2 lc rc) = countLeaves lc + countLeaves rc 


-- Exercise 7: In preparation for working on the Bert Bos puzzle in Haskell, it would be good to establish how to get a list of possible click lists. (The rest of the Bert Bos puzzle can be solved by figuring out how to filter this list down to only the successful click lists).
-- You can generate a list of all possible "click" and "noclick" strings using two built-in functions that are both available in Prelude: the 'replicate' function and the 'sequence' function. Using these two functions, write a function 'clicklists :: Int -> [[[Char]]]' that takes an integer and outputs a list of lists of strings representing clicks and non-clicks.
-- The documentation on the 'sequence' function may be a little bit confusing. When applied to an N-length list of lists, 'sequence' will yield a list of N element lists, where each of the elements are drawn from the corresponding list in the original list of lists.
-- So here, where there are 3 lists in the input, the output is a list of 3-element lists. The first element of the lists is drawn from the '[1,2]' list, the second element is drawn from '[3,4]', and the third is in all cases '5'.
-- i> sequence [[1,2],[3,4],[5]]
-- o> [[1,3,5],[1,4,5],[2,3,5],[2,4,5]]
-- Note: this function may be very useful in the Groningse Grid (Haskell edition) puzzle in the final programming assignment, if you choose that option.

clicklists :: Int -> [[[Char]]]

