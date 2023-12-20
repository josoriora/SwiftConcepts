//: [Previous](@previous)

import Foundation

import Foundation

var greeting = "Hello, playground"
let string1: String? = nil
let string2: String? = ""
let string3: String? = "value"
let array1: [String]? = nil
let array2: [String]? = []
let array3: [String]? = ["hello"]

extension Optional where Wrapped: Collection {
    var isEmptyOrNil: Bool {
        return self?.isEmpty ?? true
    }
}

string1.isEmptyOrNil // true
string2.isEmptyOrNil // true
string3.isEmptyOrNil // false
array1.isEmptyOrNil // true
array2.isEmptyOrNil // true
array3.isEmptyOrNil // false


//: [Next](@next)
