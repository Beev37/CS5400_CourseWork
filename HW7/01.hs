add' :: Int -> (Int -> Int)
add' x y = x + y

secondAdd = add'

incByThree :: Int -> Int
incByThree = add' 3


add3 :: Int -> Int
add3 n = n + 3

add3ToAll :: [Int] -> [Int]
add3ToAll = map add3


lc n = [x | x <- [1..n]]

lcc = [1,2,3]
