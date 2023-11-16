length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs


reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]


product' :: Num a => [a] -> a
product' [] = 1
product' (x:xs) = x * product' xs


filter' :: (a -> Bool) -> [a] -> [a]
filter' p [] = []
filter' p (x:xs)
    | p x = x:filter' p xs
    | otherwise = filter' p xs



op _ x = x + 1

trial :: (Foldable t, Num b) => t a -> b
trial = foldr (\_ n -> 1 + n) 0
