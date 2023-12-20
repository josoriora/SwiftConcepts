//: [Previous](@previous)

import Foundation

struct MyStruct {
    var name: String
}

var nameOne = MyStruct(name: "Pipe")
var nameTwo = nameOne

nameOne.name = "Luis"
print("Name one is \(nameOne.name)")
print("Name two is \(nameTwo.name)")

class MyClass {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var nameOneC = MyClass(name: "Pipe")
var nameTwoC = nameOne

nameOneC.name = "Luis"
print("Name one C is \(nameOneC.name)")
print("Name two C is \(nameTwoC.name)")


//: [Next](@next)
