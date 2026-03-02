//: [Previous](@previous)

import Foundation

// Define a custom error type
enum NetworkError: Error {
    case noInternet
    case serverUnavailable
    case invalidResponse
}

// Make it conform to LocalizedError to provide localized descriptions
extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInternet:
            return NSLocalizedString("No internet connection. Please check your network.", comment: "No Internet")
        case .serverUnavailable:
            return NSLocalizedString("The server is currently unavailable. Please try again later.", comment: "Server Unavailable")
        case .invalidResponse:
            return NSLocalizedString("Received invalid response from the server.", comment: "Invalid Response")
        }
    }
}

func fetchData(from url: String) throws {
    // Simulate a network issue
    let isConnected = false  // You can change this to test different cases

    if !isConnected {
        throw NetworkError.noInternet
    }

    // Simulate other errors
    let isServerAvailable = false
    if !isServerAvailable {
        throw NetworkError.serverUnavailable
    }

    // If no errors occur, continue the data fetching process...
    print("Data fetched successfully.")
}

do {
    try fetchData(from: "https://example.com")
} catch let error as LocalizedError {
    print("Error: \(error.localizedDescription)")  // This will print the localized error message
}


//: [Next](@next)
