class Board:
    def __init__(self, rows): # constructor
        self.rows = rows
        self.check()

    def __repr__(self):  # formatting (like toString())
        result = ""
        for row in self.rows:
            for cell in row:
                result = result + cell
            result = result + "\n"
        return result

    def check(self):
        # do some dynamic type checking:
        assert len(self.rows) == 3
        for row in self.rows:
            assert len(row) == 3
            for cell in row:
                assert cell in ["X","O","B"]

    def changeCell(self, cellValue, row, col):
        self.rows[row][col] = cellValue

board1 = Board(
    [["X","X","O"],
     ["X","B","O"],
     ["O","B","B"]])
    # Python has no arrays, use lists instead
    # Python has no enumerated types, use strings "X" etc.

board2 = board1 # new name for the same board
board2.changeCell("X",1,1) # both board1 and board2 change

# a heterogeneous list:
things = [111, board1, [1,2], board2, "a string"]

boards = [board1, board2]

for board in boards:
    print(board)

class Move:
    def __init__(self,player,pos): # constructor
        self.player = player
        self.pos = pos
    def __repr__(self): # formatting (like toString())
        return \
            "A move of player %s at position (%s,%s)" % \
             (self.player, self.pos[0], self.pos[1])
                # Python version of printf
    # backslash at end of line means: continue on next line

class Pause:
    def __init__(self,player): # constructor
        self.player = player
    def __repr__(self): # formatting (like toString())
        return \
            "A pause of player %s" % (self.player)
                # Python version of printf

class Win:
    def __init__(self,player): # constructor
        self.player = player
    def __repr__(self): # formatting (like toString())
        return \
            "A win of player %s" % (self.player)
                # Python version of printf


# a heterogeneous list
events = \
    [Pause("X"),
     Move("X",[1,1]),
     Pause("O"),
     Move("O",[1,2]),
     Move("X",[2,2]),
     Win("X")]

# print all elements from the list
for event in events:
    print(event)

# empty line
#print

# search for an element of class Pause and print it
#for event in events:
    #if event.__class__ == Pause:
        #print event
        #break # stop the for loop


# compute players
players = [event.player for event in events]
print(players)

# empty line
print

eventsNoPause = [event for event in events if not (event.__class__ == Pause)]

# empty line
print

# heterogeneous dictionary:
board2score = { board1 : 2.0, board2 : "dunno" }
print(board2score)
print ("board2 score = ", board2score[ board2 ]) # like array lookup
board2score[ board2 ] = 0.0 # like array update
print(board2score)
