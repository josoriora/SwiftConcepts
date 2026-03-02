//: [Previous](@previous)

/**
 Let's look at the compiler error on the code below:
 ```
 func requiresSendable(_ closure: @Sendable () -> Void) {
     closure()
 }

 class User {
     var name = "Paul"
 }

 func test() {
     let user = User()
     
     requiresSendable {
         print(user.name)   // 💥 should fail
     }
 }

 test()
 ```
 Compile error where the print is located:
 Class user does not conform to the sendable protocol.
 
 But what is sendable?
 It is a protocol that marks that an object can be passed safely from one place to another.
 From one concurrency domain to another.
 
 */

import Foundation

// How can we make the code above to compile. Let's make the class sendable.

func requiresSendable(_ closure: @Sendable () -> Void) {
    closure()
}

final class User: Sendable {
    let name = "Paul"
}

func test() {
    let user = User()
    
    requiresSendable {
        print(user.name)   // should work
    }
}

test()

/**
 In order to fix the issue we need to make the class final and sendable with inmutable properties.
 Or use a struct.
 Or use an actor.
 */

/**
 So we have that classes can implement the sendable protocol.
 and we have the @Sendable attribute to mark closures as sendable.
 */
//: [Next](@next)
