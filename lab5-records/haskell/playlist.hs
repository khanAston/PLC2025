module Main where

import Text.Printf

-- start of code to focus on in Practical 4

data Person
    = Person
        {
          person_name :: String
        }
    deriving (Eq)

instance Show Person where 
    -- using Java terminology: Person implements interface Show
    show (Person name) = name -- how to format a Person record

data Item
    = Piece
        {
            item_name :: String,
            item_performer :: Person,
            item_length_secs :: Float
        }
    deriving (Eq)

instance (Show Item) where
    show (Piece name performer len) =
        printf "%s by %s (%.1fs)" name (show performer) len

piece1 =
    Piece
    { 
        item_name = "Moonlight Sonata",
        item_performer = Person "Claudio Arrau",
        item_length_secs = 17*60+26
    }

piece2 =
    Piece
    { 
        item_name = "Moonlight Sonata",
        item_performer = Person "Daniel Barenboim",
        item_length_secs = 16*60+49
    }
  
{-
pause1 =
    Pause
    { 
        item_length_secs = 5
    }
-}

main =
    do
    -- putStrLn "piece1 and piece2 sorted by length:"
    -- putStrLn $ show shorterPiece
    -- putStrLn $ show longerPiece
    putStr "piece1 = "
    putStrLn $ show piece1
--    putStr "pause1 = "
--    putStrLn $ show pause1

-- ... = sortTwoItems (piece1, piece2) -- TASK

sortTwoItems (item1, item2) = 
    if item_length_secs item1 <= item_length_secs item2
        then (item1, item2)
        else (item2, item1)

