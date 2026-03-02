//: [Previous](@previous)

import Foundation

/*
 https://hackingwithswift.com/quick-start/concurrency/how-to-call-an-async-function-using-async-let
 
 async let allows you to launch several functions immediately and just wait for all of them to finish.
 */

struct User: Decodable {
    let id: UUID
    let name: String
    let age: Int
}

struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let message: String
}

/**
 - Even though the data(from:) method is async, we don’t need to use await before it because that’s implied by async let.
 
 - The data(from:) method is also throwing, but we don’t need to use try to execute it because that gets pushed back to when we actually want to read its return value.
 
 - Both those network calls start immediately, but might complete in any order.
 */
func loadData() async {
    async let (userData, _) = URLSession.shared.data(from: URL(string: "https://hws.dev/user-24601.json")!)

    async let (messageData, _) = URLSession.shared.data(from: URL(string: "https://hws.dev/user-messages.json")!)

    do {
        let decoder = JSONDecoder()
        let user = try await decoder.decode(User.self, from: userData)
        let messages = try await decoder.decode([Message].self, from: messageData)
        print("User \(user.name) has \(messages.count) message(s).")
    } catch {
        print("Sorry, there was a network problem.")
    }
}

Task {
    await loadData()
}

/*
 Swift allows us to do async operations using both await and async let. Await waits for the work to complete so we can read its result, whereas async let does not.
 */
//: [Next](@next)
