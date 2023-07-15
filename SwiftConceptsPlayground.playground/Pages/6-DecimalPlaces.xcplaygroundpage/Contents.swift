//: [Previous](@previous)

import Foundation

func hasDecimalPlaces(number: Decimal) -> Bool {
    let epsilon = Decimal(floatLiteral: 0.0001)
    var mutableNumber = number
    var amountFloor = number
    
    NSDecimalRound(&amountFloor, &mutableNumber, 0, .down)
    
    return (number - amountFloor) > epsilon
}

let whole1 = Decimal(integerLiteral: 10)
let whole2 = Decimal(floatLiteral: 10.0)
let whole3 = Decimal(floatLiteral: 10.5)

hasDecimalPlaces(number: whole1)
hasDecimalPlaces(number: whole2)
hasDecimalPlaces(number: whole3)

//: [Next](@next)
