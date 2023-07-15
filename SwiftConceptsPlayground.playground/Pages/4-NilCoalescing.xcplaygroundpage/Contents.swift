//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

func chainCoalescing(a: Int?, b: Int?, c: Int?) -> Int? {
    return a ?? b ?? c
}

chainCoalescing(a: 1, b: nil, c: nil)
chainCoalescing(a: nil, b: 2, c: nil)
chainCoalescing(a: nil, b: nil, c: 3)
chainCoalescing(a: 1, b: 2, c: 3)
chainCoalescing(a: nil, b: 2, c: 3)
chainCoalescing(a: nil, b: nil, c: nil)

//: [Next](@next)
