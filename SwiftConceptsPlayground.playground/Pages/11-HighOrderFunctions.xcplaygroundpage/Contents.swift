//: [Previous](@previous)

import Foundation

/**
 In Swift, **higher-order functions** are functions that take one or more functions as arguments, return a function, or both. These are often used to manipulate collections (arrays, sets, etc.) and can make code more concise and expressive.
 */


/**
### 1. map
The `map` function transforms each element in a collection using a provided closure and returns an array of the transformed elements.

#### Example:
 */

var numbers = [1, 2, 3, 4, 5]
let squaredNumbers = numbers.map { $0 * $0 }
print(squaredNumbers)  // Output: [1, 4, 9, 16, 25]

/**
- **Usage**: `map` is often used to apply a transformation to each element in a collection.

### 2. filter
The `filter` function returns an array containing only the elements that satisfy a given condition (predicate).

#### Example:
*/

numbers = [1, 2, 3, 4, 5]
let evenNumbers = numbers.filter { $0 % 2 == 0 }
print(evenNumbers)  // Output: [2, 4]

/**
- **Usage**: `filter` is used when you want to pick elements that satisfy a condition.

### 3. **`reduce`**
The `reduce` function combines all the elements of a collection into a single value, using an accumulator and a closure.

#### Example:
*/

numbers = [1, 2, 3, 4, 5]
let sum = numbers.reduce(0) { $0 + $1 }
print(sum)  // Output: 15

/**
- **Usage**: `reduce` is typically used for aggregation, like summing or multiplying all elements in a collection.

### 4. **`forEach`**
The `forEach` function iterates over each element in the collection and applies a closure. Unlike `map`, it doesn't return a new collection.

#### Example:
 */

numbers = [1, 2, 3, 4, 5]
numbers.forEach { print($0) }
/**
// Output:
// 1
// 2
// 3
// 4
// 5

- **Usage**: `forEach` is used when you want to perform an operation on each element without modifying the collection.
 */

/**
### 5. **`compactMap`**
The `compactMap` function is similar to `map`, but it removes any `nil` values from the resulting array. It transforms the elements and returns a new array without `nil` values.

#### Example:
*/

let strings = ["1", "2", "three", "4", "five"]
numbers = strings.compactMap { Int($0) }
print(numbers)  // Output: [1, 2, 4]

/**
- **Usage**: `compactMap` is used when you need to map values and safely handle `nil` values, filtering them out.

### 6. **`flatMap`**
The `flatMap` function is used to flatten a collection of collections into a single collection. It can also be used to transform the values within a collection while flattening them.

#### Example:
 */
let arrays = [[1, 2], [3, 4], [5, 6]]
let flattened = arrays.flatMap { $0 }
print(flattened)  // Output: [1, 2, 3, 4, 5, 6]


/**
- **Usage**: `flatMap` is often used when you have nested arrays and want to combine them into a single array.

### 7. **`sorted`**
The `sorted` function returns a new array with the elements of the collection sorted according to a given closure.

#### Example:
*/

numbers = [5, 3, 8, 1, 2]
let sortedNumbers = numbers.sorted()
print(sortedNumbers)  // Output: [1, 2, 3, 5, 8]
/**
- **Usage**: `sorted` is used to order the elements of a collection.

### 8. **`allSatisfy`**
The `allSatisfy` function returns `true` if all elements of a collection satisfy the given condition (predicate).

#### Example:
*/

numbers = [2, 4, 6, 8]
let areAllEven = numbers.allSatisfy { $0 % 2 == 0 }
print(areAllEven)  // Output: true

/**
- **Usage**: `allSatisfy` is used to check if all elements in a collection meet a particular condition.

### 9. **`contains`**
The `contains` function checks if any element of a collection satisfies a given condition or if the collection contains a specific element.

#### Example:
*/
numbers = [1, 2, 3, 4, 5]
let hasEven = numbers.contains { $0 % 2 == 0 }
print(hasEven)  // Output: true

/**
- **Usage**: `contains` is used when you need to check if an element exists in a collection or if any element satisfies a condition.

### 10. **`zip`**
The `zip` function combines two collections into a sequence of pairs, where each pair contains corresponding elements from both collections.

#### Example:
*/
let names = ["Alice", "Bob", "Charlie"]
let ages = [25, 30, 35]
let zipped = zip(names, ages)
for (name, age) in zipped {
    print("\(name) is \(age) years old")
}
// Output:
// Alice is 25 years old
// Bob is 30 years old
// Charlie is 35 years old

/**
- **Usage**: `zip` is used to combine two collections into pairs, often used when iterating over two related collections.
 */
