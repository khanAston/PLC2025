module Main where

data Month -- enum type definition
    = JAN | FEB | MAR | ARP | MAY | JUN
    | JUL | AUG | SEP | OCT | NOV | DEC
    deriving (Show, Eq)

-- simple pattern matching:
-- monthNum JAN = 1
-- monthNum FEB = 2
-- monthNum _ = 0 -- default case
-- ...

-- or, equivalently:
--
-- monthNum m = 
--     case m of
--         JAN -> 1
--         FEB -> 2
--         _ -> 0 -- default case

type Day_Number = Int
type Year = Int

data Date -- defining tuple type
    = DateConstr -- this is a value constructor name
      Day_Number -- type of tuple component one
      Month      -- type of tuple component two
      Year       -- type of tuple component three
    deriving Eq

instance (Show  Date) where
    show (DateConstr d m y) = -- pattern match - defines d,m,y
        (show d) ++ "/" ++
        (show m) ++ "/" ++
        (show y)

-- more pattern matching:
date_d (DateConstr d _ _) = d
date_m (DateConstr _ m _) = m
date_y (DateConstr _ _ y) = y

-- example Dates
theDay = DateConstr 1 JAN 1901
theDay2 = DateConstr 2 FEB 1901
theDay3 = DateConstr 14 FEB 1901

-- constructing tuples of predefined types:
twoDates = (theDay, theDay2) -- a pair
simpleDate1 = (10, JAN, 1901) :: (Int, Month, Int) -- a triple and its type
simpleDate2 = (,,) 10 JAN 1901 -- the same triple with visible constructor symbol

-- pattern matching tuples of predefined types:
twoDatesEqual (d1, d2) = (d1 == d2)
showSimpleDate (d, m, y) = show d ++ "/" ++ show m ++ "/" ++ show y 

firstTwoOfThreeEqual (d1,d2,d3)
    | d1 == d2 = True
firstTwoOfThreeEqual param1 = False

main =
    do
    putStrLn $ show theDay
    putStrLn $ show theDayIncreased
    putStrLn $ showSimpleDate simpleDate1
    if twoDatesEqual twoDates 
        then
        putStrLn "A weird error - this should never happen"
        else
        return () -- do nothing
    where
    DateConstr d m y = theDay -- give names to the components
    theDayIncreased = DateConstr (d + 1) m y -- make a different tuple

