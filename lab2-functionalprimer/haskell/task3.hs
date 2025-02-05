sgn x | x <  0  = -1
      | x == 0  = 0
      | otherwise  = 1

main = do
    putStrLn "Please enter a number"
    input <- getLine 
    let x = (read input :: Int)
    putStrLn( show (sgn (x)) )