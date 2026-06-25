# Collections

## Arrays

- Stores values of the same type in an ordered list
- Type: `Array<Element>` (`Element` is the type of values that array will store)
  - `[Element]` - Shorthand syntax for the type of array
- `[]` - Empty array literal
  - Example:
    ```swift
    var someInts: [Int] = []
    ```
- `[Element]()` or `Array<Element>()` - Explicit initializer syntax
  - Example:
    ```swift
    var someInts = [Int]()
    ```
- `Array(repeating:count:)` - Creating an array of a certain size with the same default values
  - Example:
    ```swift
    var array = Array(repeating: 0.0, count: 3)
    // [0.0, 0.0, 0.0]
    ```
- Create an **array literal** with a list of values (of the same type), separated by commas and surrounded by brackets
  - Example:
    ```swift
    var list: ["Eggs", "Milk"]
    ```
- `count` - property that counts the total number elements in array
- `isEmpty` - property that checks if `count` is equal to 0 (or if array does or doesn't contain elements)
- `append(_:)` - method that allows you to add an item to end of array
  - Can also add item using addition assignment operator `+=`
    - Example:
      ```swift
      var list = ["Walmart", "Costco"]
      list += ["Sams"]
      ```
- **Subscript syntax** allows you to retrieve a value from an array by passing the index within square brackets
  - Arrays are zero-indexed (first element has an index of 0)
    - Largest valid index is `count - 1`
  - Example:
    ```swift
    var list = [1,2,3]
    var firstItem = list[0]
    ```
  - Can also be used to change an existing value at a given index
- `insert(_:at:)` - method that inserts an item into the array at a specified index
  - Example:
    ```swift
    var list = [1,2,3,4,5,7,8]
    list.insert(6, at: 5)
    // list = [1,2,3,4,5,6,7,8]
    ```
- `remove(at:)` - method that removes an item at specified index and returns removed item
- `removeLast()` - method that removes the last item in array and returns removed item
- Iterate over an array using `for-in` loop
  - Example:
    ```swift
    var list = ["LeBron", "Jordan" "Kobe", "Wade", "Iverson"]
    for item in list {
      print(item)
    }
    ```
  - To retrieve the index and value of each item in array, use the `enumerated()` method to iterate over the array
    - Returns a tuple of the index and the value of each item in array
    - Example:
      ```swift
      var list = ["LeBron", "Jordan" "Kobe", "Wade", "Iverson"]
      for (index, item) in list.enumerated() {
        print("\(index + 1). \(item)")
      }
      ```

## Sets

- Stores distinct values of the same type in an unordered list
- Useful when the order doesn't matter or when to ensure that an item only appears once
- Sets contain hash-typed items
  - An item that is hash-typed is of a type that provides a way to compute a hash value, which is an `Int` value that's always the same for that item
    - If the hash value of `a` is equal to '123456' and `b` is equal to `a`, then `b`'s hash value is also '123456'
- Type: `Set<Element>`
- `Set<Element>()` - Explicit initializer syntax
  - Example:
    ```swift
    var letters = Set<Character>()
    ```
- Initialize a set with an array literal
  - Type inference doesn't occur from array literal alone, need to at least signify that it's of type `Set` (don't need to include the values type)
  - Example:
    ```swift
    var favoriteGenres: Set = ["Hip hop", "R&B", "House"]
    ```
- `count` - property that counts the total number of items in a set
- `isEmpty` - property that checks if `count` is equal to 0 (or if set does or doesn't contain elements)
- `insert(_:)` - method that inserts an item into set
- `remove(_:)` - method that removes an item if it exists in set (and returns the item) or returns `nil` if item doesn't exist
- `removeAll()` - method that removes all items in a set
- `contains(_:)` - method that checks if a set contains a particular item
- Iterate over a set with a `for-in` loop
  - To iterate over the set in order, use the `sorted()` method
    - Example:
      ```swift
      var babyNames: Set = ["Rue", "Alice", "Zhuri", "Sai"]
      for name in babyNames.sorted() {
        print("\(name)")
      }
      /* Alice
      Rue
      Sai
      Zhuri */
      ```

### Set Operations

![Intersection](https://docs.swift.org/swift-book/images/org.swift.tspl/setVennDiagram@2x.png)

- `intersection(_:)` - creates a new set with only the values that are in both set `a` and set `b`
- `symmetricDifference(_:)` - creates a new set with values that are only in set `a` and only in set `b`, but not both
- `union(_:)` - creates a new set that combines both sets
- `subtracting(_:)` - creates a new set with values from set `a` that are not in set `b`
- Example:

  ```swift
  let teamA: Set = [23, 77, 15, 3, 0]
  let teamB: Set = [24, 8, 34, 32, 3]

  teamA.intersection(teamB) //[3]
  teamA.symmetricDifference(teamB).sorted() // [0,8,15,23,24,32,34,77]
  teamA.union(teamB).sorted() // [0,3,8,15,23,24,32,34,77]
  teamA.subtracting(teamB).sorted() // [0,15,23,77]
  ```

### Set Equality

- `isSubset(of:)` - determines if all values in set `a` are contained in set `b`
- `isSuperset(of:)` - determines if set `a` contains all of the values in set `b`
- `isDisjoint(with:)` - determines if set `a` and set `b` have no values in common
- Example:

  ```swift
  let setA: Set = [4, 5]
  let setB: Set = [1, 2, 3, 4, 5]
  let setC: Set = [6, 7]

  setA.isSubset(of: teamB) // true
  setB.isSuperset(of: teamA) // true
  setC.isDisjoint(with: setA) // true
  setB.isDisjoint(with: setA) // false
  ```
