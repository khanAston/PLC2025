module Drinks where

data DrinkCategory = Water | Milk { fatContent :: Double } | Juice { fruit :: String }

drink1 = Water
drink2 = Milk 3
drink3 = Milk 1
drink4 = Juice "orange"

drinkColour :: DrinkCategory -> String
drinkColour Water = "clear"
drinkColour (Milk _) = "white"
drinkColour (Juice "orange") = "orange"
drinkColour (Juice "lemon") = "yellow"
drinkColour _ = "unknown"

