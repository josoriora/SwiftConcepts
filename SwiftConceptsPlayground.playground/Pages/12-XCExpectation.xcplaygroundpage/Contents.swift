//: [Previous](@previous)

import Foundation
import XCTest

import Foundation
import XCTest

// Simulated async function using closures
func fetchDataFromServer(completion: @escaping (String) -> Void) {
    // Simulate network delay using DispatchQueue (like a "sleep")
    DispatchQueue.global().async {
        // Simulate a network delay
        Thread.sleep(forTimeInterval: 2.0) // Sleep for 2 seconds

        // Return the result in the completion handler
        completion("Hello from the server!")
    }
}

// Create a custom XCTestCase class
class AsyncTestWithClosures: XCTestCase {

    // Test function using closure-based async code
    func testFetchDataFromServer() {
        // Set up an expectation for the async task
        let expectation = XCTestExpectation(description: "Fetching data from server")

        // Call the async function with a completion handler
        fetchDataFromServer { result in
            // Check if the result is as expected
            XCTAssertEqual(result, "Hello from the server!", "The fetched data is incorrect.")

            // Fulfill the expectation to indicate the async task is done
            expectation.fulfill()
        }

        // Wait for expectations to be fulfilled with a timeout (maximum wait time)
        wait(for: [expectation], timeout: 3)
    }
}

// Run the test manually in the Playground
let asyncTestWithClosures = AsyncTestWithClosures()
asyncTestWithClosures.testFetchDataFromServer()

//: [Next](@next)
