//: [Previous](@previous)

import Foundation

let text = "Complete a task every week to earn tickets  for a chance to win $10!"
var currency = "$"

if currency == "$" {
    currency = "\\$"
}
let pattern = "\(currency).+!"

if let range = text.range(of: pattern, options: .regularExpression) {
    print(text[range])
} else {
    print("damn")
}



//: [Next](@next)
