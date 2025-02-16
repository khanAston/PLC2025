class Piece:
    def __init__(self, name, performer, length_secs): # constructor
        self.name = name
        self.performer = performer
        self.length_secs = length_secs
        self.check()

    def __repr__(self):  # formatting (like toString())
        result = "%s by %s (%.2fs)" % (self.name, self.performer, self.length_secs)
        return result

    def check(self):
        # do some dynamic type checking:
        assert self.name.__class__ == str
        assert self.performer.__class__ == str
        assert self.length_secs.__class__ == type(1.0)
        l = self.length_secs
        assert 0 < l and l < 36000

class Product:
    def __init__(self, name, brand):
        self.name = name
        self.brand = brand
        self.check()

    def __repr__(self):  # formatting (like toString())
        result = "%s by %s" % (self.name, self.brand)
        return result

    def check(self):
        # do some dynamic type checking:
        assert self.name.__class__ == str
        assert self.brand.__class__ == str

class Advert:
    def __init__(self, product, length_secs): # constructor
        self.product = product
        self.length_secs = length_secs
        self.check()

    def __repr__(self):  # formatting (like toString())
        result = "Advert for %s by %s (%.2fs)" % (self.product.name, self.product.brand, self.length_secs)
        return result

    def check(self):
        # do some dynamic type checking:
        assert self.product.__class__ == Product
        assert self.length_secs.__class__ == float
        l = self.length_secs
        assert 0 < l and l < 120

piece1 = Piece("Moonlight", "C. Arrau", 17*60+26.0)
piece2 = Piece("Pathetique", "D. Barenboim", 16*60+49.0)
advert1 = Advert(Product("Bounty", "Mars"), 15.0)

# a heterogeneous list:
things = [111, piece1, "hello", advert1, [piece2]]

print("things = %s" % things)

piecesFromThings = "todo" #TASK 5.3.(c) -- replace "todo" by a list comprehension

print("piecesFromThings = %s" % piecesFromThings)

playlist1 = [piece1, advert1, piece2]

print("playlist1 = %s" % playlist1)

lengths1 = [ item.length_secs for item in playlist1 ]

print("lengths1 = %s" % lengths1)

playlist1noAds = [ item for item in playlist1 if item.__class__ != Advert ] 

print("playlist1noAds = %s" % playlist1noAds)

shortItemLenghts1 = "todo" # TASK 5.3.(b) -- replace "todo" by a list comprehension

print("shortItemLenghts1 = %s" % shortItemLenghts1)

# empty line
print

# heterogeneous dictionary:
pieceToScore = { piece1 : 10, piece2 : "dunno" }
print("pieceToScore = %s" % pieceToScore)
print ("piece1's score = %s" % pieceToScore[ piece1 ]) # like array lookup
print ("piece2's score = %s" % pieceToScore[ piece2 ])
pieceToScore[ piece2 ] = 10 # like array update
print("(after update) pieceToScore = %s" % pieceToScore)
