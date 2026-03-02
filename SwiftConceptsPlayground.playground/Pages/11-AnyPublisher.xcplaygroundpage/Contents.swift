//: [Previous](@previous)

import Combine
import Foundation

public class TypeWithErasedSubject {
    private let publisher = PassthroughSubject<Int,Never>()
    lazy var publicPublisher: AnyPublisher<Int, Never> = publisher.eraseToAnyPublisher()
    
    func postValue() {
        publisher.send(10)
    }
}

let erased = TypeWithErasedSubject()
let subject1 = erased.publicPublisher
let subject2 = erased.publicPublisher
let subject3 = erased.publicPublisher


erased.publicPublisher.sink { value in
    print("value = \(value)")
}

subject1.sink { value in
    print("value B = \(value)")
}

if let internalPublisher = erased.publicPublisher as? PassthroughSubject<Int, Never> {
    internalPublisher.send(5)
} else {
    print("You can't cast an erased publisher.")
}

erased.postValue()


//: [Next](@next)
