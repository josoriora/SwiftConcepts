//: [Previous](@previous)

/**
 https://www.hackingwithswift.com/quick-start/concurrency/understanding-threads-and-queues
 
- Thread: It is a sentence to be executed by the CPU that can be isolated and in parallel.
 
- Main thread: Thread where all the UI work is done.
 
- Context switch: Swapping thread work in a CPU. When you do a context switch the state of current the work has to be saved on memory so it can pass to the next unit of work.
 
- Thread explosion: Situation when there is a lot of context switching (There is a significant greater amount of created threads than the number of available CPUs) The cost of context switching grows high (more memory - nothing gets completed).
 
- Queue: Abstraction that allows you to execute work and the queue decides how to complete it. A queue can be serial or concurrent. Same as you would think of checkout line in a grocery store. One line that goes into a single cashier (serial) or one line that then splits into multiple cashiers (concurrent).
 
 - Main thread vs Main Queue:
 The main queue will always execute on the main thread (Other queues might run on the main thread for efficiency).
 
 But here is the trick:
 - If you are on the main queue, you are definetly on the main thread, but being on the main thread doesn't automatically mean you are on the main queue (a different queue could be for a moment on the main thread)

 */

//: [Next](@next)
