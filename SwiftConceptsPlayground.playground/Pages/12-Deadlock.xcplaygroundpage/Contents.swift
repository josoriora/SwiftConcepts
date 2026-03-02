//: [Previous](@previous)

import Foundation

let lock1 = NSLock()
let lock2 = NSLock()

func deadlockExample() {
    DispatchQueue.global().async {
        lock1.lock()
        sleep(1)
        lock2.lock()
        
        print("Thread 1")
        
        lock2.unlock()
        lock1.unlock()
    }
    
    DispatchQueue.global().async {
        lock2.lock()
        sleep(1)
        lock1.lock()
        
        print("Thread 2")
        
        lock1.unlock()
        lock2.unlock()
    }
    
}

deadlockExample()

extension [Int] {
    func average() -> Int {
        let count = self.count
        var average = 0
        
        self.forEach { value in
           average += (value / count)
        }
        
        return average
    }
}




//: [Next](@next)
