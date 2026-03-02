//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

protocol SampleProtocol {
    func foo()
}

extension SampleProtocol {
    func foo() {
        print("protocol foo")
    }
    func bar() {
        print("protocol bar")
    }
}

class SampleClass: SampleProtocol {
    func foo() {
        print("class foo")
    }
    
    func bar() {
        print("class bar")
    }
}

let sample: SampleProtocol = SampleClass()
sample.foo()
sample.bar()
//: [Next](@next)
