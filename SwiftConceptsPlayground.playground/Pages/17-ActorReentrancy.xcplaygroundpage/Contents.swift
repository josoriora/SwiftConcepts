//: [Previous](@previous)

import Foundation
import PlaygroundSupport

/**
 https://www.hackingwithswift.com/quick-start/concurrency/what-is-actor-reentrancy-and-how-can-it-cause-problems
 */

actor Player {
    var name = "Anonymous"
    var score = 0

    func addToScore() {
        Task {
            score += 1
            try? await Task.sleep(for: .seconds(1))
            print("Score is now \(score)")
        }
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true

let player = Player()
await player.addToScore()
await player.addToScore()
await player.addToScore()

try? await Task.sleep(for: .seconds(1.1))

PlaygroundPage.current.finishExecution()


//: [Next](@next)
