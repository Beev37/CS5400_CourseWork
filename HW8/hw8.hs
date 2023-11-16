-- HW 8:

-- Exercise 1: library function 'replicate :: Int -> a -> [a]' takes a number n and another argument and returns a list with the second argument repeated n times. Implement a version of this function called "replicate'" which has the same meaning but is defined using a list comprehension

replicate' :: Int -> a -> [a]
replicate' n x = [x | a <- [1..n]]


-- Exercise 2: the scalar product of two lists of integers 'xs' and 'ys' of length 'n' is given by the sume of the products of corresponding integers. Show how a list comprehension can be used to define a function 'scalarproduct :: [Int] -> [Int] -> Int' that returns the scalar product of two lists.

scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum [ x*y | (x, y) <- zip xs ys ]


-- Exercise 3: Anonymous functions can be defined in Haskell using lambda expressions. Consider: 'mult x y z = x * y * z'. Give an alternate definition of 'mult' that has the same meaning but which uses the lambda operator for each argument

-- Unsure how to write the type signature for this
-- mult :: Num -> Num -> Num -> Num
mult x y z = (\a -> a * (\b -> b * (\c -> c) z) y) x


-- ** Exercise 4: Show how a single comprehension with two generators, for example: '[(x,y) | x <- [1,2,3], y <- [4,5,6]]', can be re-expressed using two comprehensions with single generators. Make use of the library function concat and nest one comprehension within the other. This should look similar to the above, i.e. it should be expressed in a single line of code (you don't need to write any helper functions), however it will make use of the built-in function concat, which operates on a list of lists. 
-- To solve this problem, first run the above line of code and see what it outputs. Consider whether there is an intuitive way to think of the output list as being a concatenation of three smaller lists. You will structure the solution to this question as a list comprehension on the head of another list comprehension, and then concatenate the results of the outer comprehension.

blah :: [a] -> [b] -> [(a, b)]
blah xs ys = [(x,y) | x <- xs, y <- ys]

blah' :: [a] -> [b] -> [(a, b)]
blah' xs ys = concat [[(x,y)| x<-xs] | y<-ys]


-- Exercise 5: Write a function that inserts an element into a list at a given position. Assume that position 1 is the first position. So, for example: > 'insertAt 'X' "abcd" 2' ---output---> "aXbcd". If the number given is higher than the length of the list, place the element to be inserted at the end of the list. You may use whatever library functions or logical structures you think are appropriate. 

insertAt :: a -> [a] -> Int -> [a]
insertAt x ys i
    | i < 0 = x:ys
    | i > length ys = ys ++ [x]
    | otherwise = take (i-1) ys ++ [x] ++ drop (i-1) ys


-- ** Exercise 6: Write a function that removes all duplicate elements from a list. You may use whatever library functions you need except 'nub'. You may write whatever helper functions you need. It might help to think about how you would have done this recursively in Prolog.

removeDup :: (Eq a) => [a] -> [a]
removeDup [] = []
removeDup (x:xs)
    | member x xs = removeDup xs
removeDup (x:xs) = x : removeDup xs


member :: (Eq a) => a -> [a] -> Bool
member x [] = False
member x (y:ys)
    | x == y = True
    | otherwise = member x ys

-- ** Exercise 7: Write a function that takes a list of numbers and a number n and returns a list of pairs of numbers from the original list, such that each pair adds up to n. Any given pair of the same two numbers (in any order) should appear only once in the final list and elements in the original list cannot be duplicated (a number can appear more than once in the solution only if it also appears more than once in the original list, as in the case of the number 5 in the example below).
    -- i>   sumpairs [5,1,4,0,5,6,9] 10
    -- o>   [(5,5),(1,9),(4,6)]
-- The tuples can appear in any order. You may use library functions or write whatever helper functions you need. 

sumpairs :: (Eq a, Num a) => [a] -> a -> [(a, a)]
sumpairs xs v = noDups [(a,b) | a <- xs, b <- xs, a+b == v]
-- sumpairs' xs v = concat [[(a,b) | a<-xs, a+b==v] | b<-xs] -- attempt at double LC version

member'' :: (Eq a, Eq b) => (a, b) -> [(a, b)] -> Bool
member'' (a,b) [] = False
member'' (a,b) ((c,d):ys)
    | (a,b) == (c,d) = True
    | otherwise = member (a,b) ys

noDups :: Eq a => [(a, a)] -> [(a, a)]
noDups [] = []
noDups ((a,b):xs)
    | member'' (a,b) xs || member'' (b,a) xs = noDups xs
noDups (x:xs) = x:noDups xs




