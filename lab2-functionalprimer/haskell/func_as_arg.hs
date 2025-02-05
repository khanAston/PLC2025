--create inpFunc
inpFunc numA numB = [numA..numB] 

--Define applicatorFunc
applicatorFunc inpFunc calctype  
    | calctype == 's' = fromIntegral (sum inpFunc) --Sum as doub;e if sum
    | calctype == 'a' = fromIntegral (sum inpFunc)/fromIntegral (length inpFunc) --Average as doub;e if average
    | otherwise = 00.00

main = do
    putStrLn "Please enter the first number"
    a <- getLine 
    let numA = read a :: Int
    putStrLn "Please enter the second number"
    b <- getLine 
    let numB = read b :: Int
    putStrLn "Please enter the type of calculation - s or a"
    calctype <- getChar 
    let result = applicatorFunc (inpFunc numA numB)  calctype  --Call applicatorFunc with inpFunc and 'a'/ 's' as args
    putStrLn("sum = " ++ show(result:: Double) ++ "!! WILL BE 0 if you input something not a or s")-- explicitly say the result is a double