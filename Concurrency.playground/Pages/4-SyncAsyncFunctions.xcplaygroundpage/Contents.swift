//: [Previous](@previous)

/**
 https://www.hackingwithswift.com/quick-start/concurrency/what-is-a-synchronous-function
 
 What is a synchronous function?
 A synchronous function is one that executes all its work in a simple, straight line on a single thread.
 
 A function can call other functions and when this happens a stack is used. Since this can
 happen recursively the initial function won't finish until the previous one are executed.
 This is blocking code because the CPU has to wait for this.
 
 https://www.hackingwithswift.com/quick-start/concurrency/what-is-an-asynchronous-function
 What is an asynchronous function?
 An asynchronous function is one that can execute tasks on other thread and not block the
 CPU while doing so.
 */

// sync function
func randomD6() -> Int {
    Int.random(in: 1...6)
}

let result = randomD6()
print(result)

// async function
func randomD6() async -> Int {
    Int.random(in: 1...6)
}

Task {
    let result2 = await randomD6()
    print(result2)
}

/*
 Async functions do not block: when we call them with await we are marking a suspension point, which is a place where the function can suspend itself – literally stop running – so that other work can happen. At some point in the future the function’s work completes, and Swift will wake it back up out of its “suspended animation”-like existence and it will carry on working.
 
 So, async functions are like regular functions, except they have a superpower: if they need to, they can suspend themselves and all their callers, freeing up their thread to do other work.
 */


//: [Next](@next)
