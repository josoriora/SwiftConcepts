//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var items: [Int] = Array(0...40000)
    
    init() { }
    
}

struct Cell: View {
    let item: Int
    
    init(with item: Int) {
        self.item = item
        print("init Cell item \(item)")
    }
    
    var body: some View {
        Text("Hello, world! \(item)")
            .padding()
    }
}

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Text("Hello, world! \(viewModel.items.count)")
        List(viewModel.items, id: \.self) { item in
            Cell(with: item)
        }
        .frame(width: 320, height: 568, alignment: .center)
    }
}

PlaygroundPage.current.setLiveView(ContentView())

/*
 List vs LazyStack.
 
 List is backed by a collection view so internally there is view reuse and starting iOS 15 it only renders the elements that are visible on the screen as presented on the code above.
 
 LazyVStack just loads the swift UI views lazily but once thet are loaded will stay on memory.
 */

//: [Next](@next)
