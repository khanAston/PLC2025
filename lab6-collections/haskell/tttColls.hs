module TTTColls where

import qualified Data.Map as Map
import qualified Text.PrettyPrint.HughesPJ as PP

data Player
    = Player_X | Player_O
    deriving (Eq)
instance (Show Player) where
    show Player_X = "X"
    show Player_O = "O"

data Cell
    = X | O | B
    deriving (Eq, Ord)
instance (Show Cell) where
    show X = "X"
    show O = "O"
    show B = "."

data Board
    = Board [[Cell]] -- list of lists (ie rows) of cells
    deriving (Eq, -- enable default "equals" testing
              Ord) -- enable default comparator for sorting
                   --    lists of boards

-- IGNORE THE FOLLOWING, assume it works
instance (Show Board) where
    show board =
        PP.render $ pprintBoard board
    showList boards _ =
        -- arrange boards horizontally
        PP.render $ PP.hsep $ PP.punctuate (PP.text " ") $
          map pprintBoard boards

-- IGNORE THE FOLLOWING, assume it works
pprintBoard (Board rows) =
    -- print each row and arrange rows vertically
    PP.vcat $ map pprintRow $ rows
        where
        pprintRow cells =
            -- concatenate cells horizontally
            PP.hcat $ map (PP.text . show) cells


-- IGNORE THE FOLLOWING, assume it works
changeCell (Board rows) cellValue (row,col) =
    Board newRows
        where
        newRows =
            updateListElem
                row -- update this index
                (updateListElem col (const cellValue))
                        -- using this function, which
                        -- updates the correct cell in the row
                rows -- in this list


-- IGNORE THE FOLLOWING, assume it works
-- modifying one element in a list is a pain...
-- one needs to construct a new list from scratch
updateListElem index fn list =
    (take index list) -- elements up to index: no change
    ++    -- concatenate
    [fn (list !! index)] -- the element that is changed
    ++    -- concatenate
    (drop (index + 1) list) -- the rest does not change


-- a union type of different kinds of events
data Event
    = EventMove -- variant one
      {
        ev_player :: Player,
        ev_pos :: (Int, Int) -- a pair (tuple) type
      }
    | EventPause --variant two
      {
        ev_player :: Player
      }
    | EventWin -- variant three
      {
        ev_player :: Player
      }
    deriving (Eq)

-- check for the Pause variant of the above type
isPause (EventPause _) = True -- pattern for Pause events
isPause _ = False -- all other values are not a Pause

-- how to format events
instance (Show Event) where
    show (EventMove player (row, col)) =
        "Move of player " ++ show player ++
            " to (" ++ show row ++ "," ++ show col ++ ")"
    show (EventPause player) =
        "Pause of player " ++ show player
    show (EventWin player) =
        "Win of player " ++ show player

-- example boards
board1 =
    Board
    [[X,X,O],
     [O,B,X],
     [O,B,B]]

board2 =
    changeCell board1 X (1,1)

board3 =
    Board
    [[X,X,O],
     [O,B,X],
     [O,B]] -- oops a mistake...

board4 =
    changeCell board3 X (1,1)

allBoards = [board1, board2, board3, board4]

-- (boardOK board) returns a boolean indicating whether
-- the board is of the correct dimensions (3x3).
boardOK :: Board -> Bool
boardOK (Board rows) =
    length rows == 3 && -- check there are 3 rows
    (and -- takes a list of booleans and checks that
         -- all of them are true
        [length row == 3 | row <- rows])
          -- test whether each row has 3 cells,
          -- return a list of booleans - results of these tests
          
goodBoards =
    filter boardOK allBoards


events =
    [EventPause Player_X,
     EventMove Player_X (1,1),
     EventPause Player_O,
     EventMove Player_O (1,2),
     EventMove Player_X (2,2),
     EventWin Player_X]

players =
    [ ev_player event | event <- events ]

eventsNoPause =
    [ event | event <- events, not (isPause event) ]

games :: [[Event]]
games = [events, tail (reverse events), [], [EventWin Player_O]]

main =
    do
    putStrLn $ "all boards :\n" ++ show allBoards
    putStrLn $ "good boards :\n" ++ show goodBoards
    putStrLn $ "games :\n" ++ unlines (map show games)
