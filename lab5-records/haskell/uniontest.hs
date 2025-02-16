module Main where

data Month -- enum type definition
    = JAN | FEB | MAR | APR | MAY | JUN
    | JUL | AUG | SEP | OCT | NOV | DEC
    deriving (Show)

type Day_Number = Int
type Year = Int

data Date -- defining union record type
    = DateDMYConstr -- this is a value constructor name
    {
        date_d :: Day_Number,
        date_m :: Month,
        date_y :: Year
    }
    | DateDYConstr -- alternative value constructor
    {
        date_d :: Day_Number,
        date_y :: Year    
    }

instance (Show  Date) where
    show (DateDMYConstr d m y) =
        (show d) ++ "/" ++
        (show m) ++ "/" ++
        (show y)
    show (DateDYConstr d y) =
        (show d) ++ "//" ++
        (show y)

theDay = DateDMYConstr { date_d = 1, date_m = JAN, date_y = 1901 }
theDay2 = DateDYConstr 111 1901

main =
    do
    putStrLn $ show $ theDay
    putStrLn $ show $ theDay2
    putStrLn $ show $ theDay2 { date_d = 1 + (date_d theDay2) }

