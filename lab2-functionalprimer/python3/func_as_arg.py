def listFunc(num1, num2):
    return [i for i in range(num1, num2+1)] #Create list of ints from num1 to num2, including num 2

def applicatorFunc(inpFunc, calcType):
    if calcType =='s':
        return sum(inpFunc)
    else:
        return sum(inpFunc)/len(inpFunc)

num1 = int(input("First Number:"))
num2 = int(input("Second Number:"))
calcType = str(input("a or s"))

print(applicatorFunc(listFunc(num1, num2), calcType))
