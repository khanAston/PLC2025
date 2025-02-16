module Main where

data Month -- enum type definition
    = JAN | FEB | MAR | APR | MAY | JUN
    | JUL | AUG | SEP | OCT | NOV | DEC
    deriving (Show, Enum, Bounded, Eq, Ord)

type Day_Number = Int
type Year = Int

data Date -- defining record type
    = DateConstr -- this is a value constructor name
    {
        date_d :: Day_Number,
        date_m :: Month,
        date_y :: Year
    }

instance (Show  Date) where
    show date =
        (show $ date_d date) ++ "/" ++
        (show $ date_m date) ++ "/" ++
        (show $ date_y date)


theDay = DateConstr { date_d = 1, date_m = JAN, date_y = 1901 }
theDay2 = DateConstr 31 DEC 1900

-- a bit more advanced processing of records:
computeNextDay date@(DateConstr d m y) -- two patterns for one record
     | d + 1 <= dayMax  -- not the last day of month
        = date { date_d = d + 1 }
     | m < maxBound -- last day of month but not the last month
        = date { date_d = 1, date_m = succ m }
     | otherwise -- last day of year
        = DateConstr 1 JAN (y + 1)
     where
     dayMax = daysInMonth m y

daysInMonth FEB y
    | isStepYear = 29
    | otherwise = 28
    where
    isStepYear = y `mod` 4 == 0 -- a step year occurs every four years (almost true...)
daysInMonth APR _ = 30
daysInMonth JUN _ = 30
daysInMonth SEP _ = 30
daysInMonth NOV _ = 30
daysInMonth _ _ = 31 -- all other months

main =
    do
    putStrLn $ show $ theDay
    putStrLn $ show $ theDay { date_d = 1 + (date_d theDay) }
    putStrLn $ show $ computeNextDay theDay2

-- a bit off topic:
dates =
  [theDay, theDay2]

formattedDates =
  map show dates

yearsFromDates =
  map date_y dates

