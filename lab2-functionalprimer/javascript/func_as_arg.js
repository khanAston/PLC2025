//Create list of ints from 1 to 5, Haskell equivalent [1..5]
function arrFunc(num1, num2){
    let arr = [];
    for (let i = num1; i<=num2 ; i++) {
        arr.push(i);
    }
    return arr;    
}

function applicatorFunc(inpFunc, s, num1, num2){
    if(s=='s'){
        const arr = arrFunc(num1, num2);        
        let sum = arr.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
        return sum;
    }
    else{        
        const arr = arrFunc(num1, num2);
        let sum = arr.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
        return sum /(num2-num1+1 );
    }
}


let x = applicatorFunc(arrFunc, 'a', 1, 10);
console.log(x);
