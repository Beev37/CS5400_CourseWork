-- HW 8:

-- Exercise 1: library function 'replicate :: Int -> a -> [a]' takes a number n and another argument and returns a list with the second argument repeated n times. Implement a version of this function called "replicate'" which has the same meaning but is defined using a list comprehension

replicate' :: Int -> a -> [a]
replicate' n x = [x | a <- [1..n]]


-- Exercise 2: the scalar product of two lists of integers 'xs' and 'ys' of length 'n' is given by the sume of the products of corresponding integers. Show how a list comprehension can be used to define a function 'scalarproduct :: [Int] -> [Int] -> Int' that returns the scalar product of two lists.

scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = [x| ]