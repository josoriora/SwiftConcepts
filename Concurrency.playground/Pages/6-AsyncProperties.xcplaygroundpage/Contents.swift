//: [Previous](@previous)

import Foundation

/*
 https://www.hackingwithswift.com/quick-start/concurrency/how-to-create-and-use-async-properties
 
 On swift we can create computed properties that are async and that can throw as well. But they should be
 read only if you create a setter the compiler will cry.
 */

// First, a URLSession instance that never uses caches
extension URLSession {
    static let noCacheSession: URLSession = {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return URLSession(configuration: config)
    }()
}

// Now our struct that will fetch and decode a URL every
// time we read its `contents` property
struct RemoteFile<T: Decodable> {
    let url: URL
    let type: T.Type

    var contents: T {
        get async throws {
            let (data, _) = try await URLSession.noCacheSession.data(from: url)
            return try JSONDecoder().decode(T.self, from: data)
        }
    }
}

//: [Next](@next)
