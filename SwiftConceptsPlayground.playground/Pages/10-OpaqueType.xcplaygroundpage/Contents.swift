//: [Previous](@previous)

import Foundation

/**
 https://www.avanderlee.com/swift/some-opaque-types/
 
 https://www.donnywals.com/what-is-the-some-keyword-in-swift/
 
 Opaque types allow you to describe the expected return type without defining a concrete type. A common place where we use opaque types today is inside the body of a SwiftUI view:
 
 var body: some View { ... }
 */

/**
 In the past in order to return on a function a protocol with associates type we needed to put that protocol as a generic constraint on that method.
 
 As seen below:
 */

protocol ListItemDisplayable {
  var name: String { get }
}

struct Shoe: ListItemDisplayable {
  let name: String
}

struct ShoesDataSource: ListDataSource {
  let items: [Shoe]
  var numberOfItems: Int { items.count }

  func itemAt(_ index: Int) -> Shoe {
    return items[index]
  }
}

protocol ListDataSource {
  associatedtype ListItem: ListItemDisplayable

  var items: [ListItem] { get }
  var numberOfItems: Int { get }
  func itemAt(_ index: Int) -> ListItem
}

/*
 What if we want to create a builder that returns a ListDataSource, we would do something like this:
 
 struct ViewModelGenerator {
   func listProvider(for items: [Shoe]) -> ListDataSource {
     return ShoesDataSource(items: items)
   }
 }

 But this does not compile.
 
 But if we use the some operator it will work:
 */

struct ViewModelGenerator {
  func listProvider(for items: [Shoe]) -> some ListDataSource {
    return ShoesDataSource(items: items)
  }
}

/*
Opaque type as reverse generics:
 
 The Swift documentation on opaque result types sometimes refers to them as reverse generics which is a pretty good description. Before opaque result types, the only way to use protocols with associated types as a return type would have been to place the protocol on a generic constraint for that method. The downside here is that the caller of the method gets to decide the type that’s returned by a function rather than letting the function itself decide:

*/

//: [Next](@next)
