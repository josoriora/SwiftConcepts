//: [Previous](@previous)

import Foundation

class Parent {
    func parentMethod() {
        print("parent")
    }
}

class Child: Parent {
    var closure: (() -> (Void))? = nil
    
    override init() {
        super.init()
    }
    
    func setClosure() {
        closure = {
            super.parentMethod()
        }
    }
    
    override func parentMethod() {
        print("child")
    }
    
    deinit {
        print("I am out")
    }
}

var child: Child? = Child()

child?.setClosure()
child = nil

//: [Next](@next)
