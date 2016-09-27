//: Playground - noun: a place where people can play

import UIKit

let allNumbers : Array<Int> = [1,2,3,4,5,6,7,8,9,10]

func isEven(number:Int) -> Bool{
    return number%2 == 2
}


func returnList() -> Array<Int>{
    return [1]
}

let evenNumbers = allNumbers.filter(isEven)
print(evenNumbers)

let list = returnList()
print(list)
