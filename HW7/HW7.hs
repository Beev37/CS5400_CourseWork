-- Exercise 1: What are the types of the following values?
-- v1: ['a', 'b', 'c']
    -- Type1: [Char]

-- v2: ('a', 'b', 'c')
    -- Type2: (Char, Char, Char)

-- v3: [(False, '0'), (True, '1')]
    -- Type3: [(Bool, Char)]

-- v4: ([False, True], ['0', '1'])
    -- ([Bool], [Char])

-- v5: [tail, init, reverse]
    -- [a]


-- Exercise 2: Find the type of these functions
second :: [a] -> a
second xs = head (tail xs)

swap :: (a, a) -> (a, a)
swap (x, y) = (y, x)

pair :: a -> (a -> (a, a))
pair x y = (x, y)

double :: Int -> Int
double x = x * 2

palindrome :: String -> Bool
palindrome xs = reverse xs == xs

-- twice :: a -> (a -> a) -- my attempt
twice :: (a -> a) -> a -> a -- discussed in class
twice f x = f (f x)


-- Exercise 3: Some of the following expressions are not syntactically correct, while others are syntactically correct but do not have sensible types. Some are well-formed. Which is which? In the case of the well-formed expressions, give their types. 

-- [0, 1)                       ~~ Syntactically incorrect: mixed characters denoting tuple or list

-- double -3                    ~~ Syntactically incorrect: can't parse '-' correctly

-- double (-3)                  ~~ Well formed. -- double :: Int -> Int

-- double double 0              ~~ Syntactically incorrect: formatting implies that double takes 2 arguments where one is a function and the other an int

-- if 1==0 then 2==1            ~~ Syntactically incorrect: needs to be part of some function (not sure i understand this one well)

-- "++" == "+" ++ "+"           ~~ Well formed. -- [Char] == [Char] ++ [Char]

-- [(+),(-)]                    ~~ Unsensible typing: elements nested in 1-tuples are not valid

-- [[],[[]],[[[]]]]             ~~ Well formed. -- [[a], [b], [c]]

-- concat ["tea", "for", '2']   ~~ Unsensible typing: last element '2' is in single quotes - making it a Char instead of a [Char]

-- concat ["tea", "for", "2"]   ~~ Well formed. -- concat :: [[Char]] ->[Char]


-- Exercise 4: Using built-in list functions, define a function halve :: [a] -> ([a],[a]) that splits an even-lengthed list into two halves, and an odd list into as near as possibly equal parts.

halve :: [a] -> ([a], [a])
halve xs = (take (length xs `div` 2) xs, drop (length xs `div` 2) xs)


-- Exercise 5: The built-in predicate prdct :: Num a => [a] -> a returns the prdct of all the numbers in a list of numbers. Implement your own recursive version of this function. Name your function prdct' (note the prime) and define it using the * operator. Use pattern matching Links to an external site. to implement the base case and the recursive case.

prdct :: Num a => [a] -> a
prdct [] = error "empty list"
prdct [x] = x
prdct (x:xs) = x * lTail where lTail = prdct xs


-- Exercise 6: The built-in function tail will produce an error if it's called with the empty list. Define a function safetail :: [a] -> [a] that behaves the same as the library function tail, except that safetail maps the empty list to itself, rather than producing an error. Define your function in three different ways, using each of the following:
    -- (a) a conditional expression
    -- (b) guarded equations
    -- (c) pattern matching
-- Call the three functions safetail, safetail', and safetail'' and include the type declarations for all three.

safetail :: [a] -> [a]
safetail xs =  
    if length xs == 0
        then []
    else tail xs

safetail' :: [a] -> [a]
safetail' xs
    | length xs == 0 = []
    | otherwise = tail xs

safetail'' :: [a] -> [a]
safetail'' [] = []
safetail'' xs = tail xs


-- Exercise 7: List comprehensions are powerful tools for processing lists. Using a list comprehension, give an expression that calculates the sum 1^2+2^2+...100^2 of the first one hundred integer squares.

lcCalc :: Int
lcCalc = sum [x*x | x <- [1..100]]

