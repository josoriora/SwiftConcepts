//: [Previous](@previous)

import Foundation

class StringWrapper {
    var value: String
    
    init(_ value: String) {
        self.value = value
    }
}

var brand = StringWrapper("Apple")

let closure = { [brand] in
    print("I love \(brand.value)")
}

brand.value = "Microsoft"

closure()

//: [Next](@next)
