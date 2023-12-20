//: [Previous](@previous)

import Foundation



/*
 https://www.hackingwithswift.com/quick-start/concurrency/how-to-call-async-throwing-functions
 Just as a regular function an async function can throw errors as well.
 */

func fetchFavorites() async throws -> [Int] {
    let url = URL(string: "https://hws.dev/user-favorites.json")!
    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode([Int].self, from: data)
}

if let favorites = try? await fetchFavorites() {
    print("Fetched \(favorites.count) favorites.")
} else {
    print("Failed to fetch favorites.")
}

/*
 Function declaration needs to use the keywords in a defined order **async throws**.
 Function calling needs to also be done on an specific order as well **try await**.
 */

/*
 Tip: When executing an async function and the implementation does not suspend (sync code done on async method). The func is executed inmediately (using await will not cause your code to wait for one runloop to go by before continuing).
 
 It’s a common joke that many coding problems can be fixed by waiting for one runloop tick to pass before trying again – usually seen as DispatchQueue.main.async { … } in Swift projects – but that will not happen when using await, because the code will execute immediately.
 */

//: [Next](@next)
