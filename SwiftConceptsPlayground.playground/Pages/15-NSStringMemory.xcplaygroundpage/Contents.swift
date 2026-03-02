//: [Previous](@previous)

import Foundation
import UIKit

var str:NSString = "Hello, playground"

var newStr = str

newStr = "hello"

print(Unmanaged.passUnretained(str).toOpaque())
print(Unmanaged.passUnretained(newStr).toOpaque())

print(str)
print(newStr)

//: [Next](@next)
