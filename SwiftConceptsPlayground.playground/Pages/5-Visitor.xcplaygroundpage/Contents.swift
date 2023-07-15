//: [Previous](@previous)

import Foundation

/**
 Based on https://refactoring.guru/design-patterns/visitor/swift/example#example-0
 
 1. Define the visitor protocol.
 Each of the function is one representation of the polymorphic output.
 
 
 The Visitor Interface declares a set of visiting methods that correspond to
 component classes. The signature of a visiting method allows the visitor to
 identify the exact class of the component that it's dealing with.
 */

protocol Visitor {
    associatedtype VisitResult

    func visitConcreteComponentA(element: ConcreteComponentA) -> VisitResult
    func visitConcreteComponentB(element: ConcreteComponentB) -> VisitResult
}

/**
 2. Define the interface that each component should declare. This interface connects each Concrete component with the visitor to resolve the visit at run time.
 
 The Component interface declares an `accept` method that should take the
 base visitor interface as an argument.
 */
protocol Component {
    func accept<V: Visitor>(visitor: V) -> V.VisitResult
}

/**
 3. Define each Concrete Component and its conformance to the Component Protocol.
 */

class ConcreteComponentA: Component {
    var propertyFromA = "ConcreteComponentA"
    
    func accept<V: Visitor>(visitor: V) -> V.VisitResult {
        visitor.visitConcreteComponentA(element: self)
    }
}

class ConcreteComponentB: Component {
    var propertyFromB = "ConcreteComponentB"
    
    func accept<V: Visitor>(visitor: V) -> V.VisitResult {
        visitor.visitConcreteComponentB(element: self)
    }
}

/**
 4. Define concrete Visitor.
 Define the output of the visit result so all the return types are strictly defined.
 In each function of the visit protocol use the concrete input parameter to calculate the expected result.
 */

class ConcreteVisitor: Visitor {
    typealias VisitResult = String
    
    func visitConcreteComponentA(element: ConcreteComponentA) -> String {
        element.propertyFromA
    }
    
    func visitConcreteComponentB(element: ConcreteComponentB) -> String {
        element.propertyFromB
    }
}

/**
 5. Use.
 See that with an interface we get different values depending on the concrete type.
 */

let components: [Component] = [ConcreteComponentA(), ConcreteComponentB()]
let visitor = ConcreteVisitor()
components.forEach { component in
    print(component.accept(visitor: visitor))
}



//: [Next](@next)
