module Main where

import Text.Printf

data Product
    = Product
        {
          product_name :: String
        , product_brand :: String
        }
    deriving (Eq)

instance Show Product where 
    show (Product name brand) = 
        printf "%s by %s" name brand

data Item
    = Piece
        {
            item_name :: String,
            item_performer :: String,
            item_length_secs :: Float
        }
    | Advert
        {
            item_product :: Product,
            item_length_secs :: Float
        }
    deriving (Eq)

isAdvert (Advert _ _) = True
isAdvert _ = False

itemOK (Piece _ _ len) = 0 < len && len < 36000
itemOK (Advert _ len) = 0 < len && len < 120

instance (Show Item) where
    show (Piece name performer len) =
        printf "%s by %s (%.1fs)" name performer len
    show (Advert product len) =
        printf "Advert for %s (%.1fs)" (show product) len

piece1 = Piece "Moonlight" "C. Arrau" (17*60+26)
piece2 = Piece "Pathetique" "D. Barenboim" (16*60+49)
advert1 = Advert (Product "Bounty" "Mars") 15

playlist1 = [piece1, advert1, piece2]

lengths1 = [ item_length_secs item | item <- playlist1 ]

playlist1noAds = [ item | item <- playlist1, not (isAdvert item) ]

playlist2 = [piece2, advert1]

playlists = [playlist1, playlist2] -- a list of lists

adsFromPlaylists = "todo" -- TASK 5.4(b)

shortItemLenghts1 = "todo" -- TASK 5.4(a)

main =
    do
    printf "playlist1 = %s\n" (show playlist1)
    printf "lenghts1 = %s\n" (show lengths1)
    printf "playlist1noAds = %s\n" (show playlist1noAds)
    printf "shortItemLenghts1 = %s\n" (show shortItemLenghts1)
    putStrLn ""
    printf "playlist2 = %s\n" (show playlist2)
    printf "playlists = %s\n" (show playlists)
    printf "adsFromPlaylists = %s\n" (show adsFromPlaylists)

