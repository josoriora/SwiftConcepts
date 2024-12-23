//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//MARK: Lazy sequences

/**
 Lazy sequences are regular sequences where each item is computed on demand rather than up front. For example, consider this array of numbers:
 */

let numbers = Array(1...100000)

/**
 That will hold 100,000 numbers. Now, if we wanted to double all those numbers, we’d write something like this:
 */

let doubled = numbers.map { $0 * 2 }

/**
 That will cause Swift to double all 100,000 numbers, and sometimes that’s exactly what you want. However, if you know you intend to use only a handful of them, you can make the calculation lazy instead, like this:
 */

let lazyDoubled = numbers.lazy.map { $0 * 2 }

/**
 Now that map() call won’t do any work up front – it just stores the original array (numbers 1 to 100,000) alongside the transformation closure (double each number). So, when you request item 5,000 it can calculate just that one for you and return it in a split second – a significant time saving.
 */

//: [Next](@next)
