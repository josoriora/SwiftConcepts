//: [Previous](@previous)

import Foundation

/**
 async let => run something but dont wait for it.
 await => run something and wait for it.
 */

// await pattern


func fetchData() async -> Data? {
    // do work here
    nil
}

func process(_ data: Data?) async -> Bool {
    true
}

let download = await fetchData()
let result = await process(download)

// result depends on download so it makes sense to make then depend on each other.
// we accomplish that with await.

// Now let's use async let
// Make several unrelated things to work.
// We can always await for them at the end.

func getNews() async -> [String] { [] }
func getWeather() async -> [String] { [] }
func getUpdateAvailable() async -> Bool { true }

func getAppData() async -> ([String], [String], Bool) {
    async let news = getNews()
    async let weather = getWeather()
    async let hasUpdate = getUpdateAvailable()
    return await (news, weather, hasUpdate)
}

// News, weather and hasUpdate start simultaneously.
// the tuple at the end waits for all of them to finish.


//: [Next](@next)
