module Main where

main =
    do
    print (myFunc1 5)
    print (myFunc2 10)
    print (myFunc3)

myFunc1 x = x*10
myFunc2 y = y*2
myFunc3 = "Hello, this is 3rd Func"