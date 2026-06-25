# Collections

## Arrays

- Stores values of the same type in an ordered list
- `[Element]` - Syntax for the type of array (`Element` is the type of values that array will store)
- `[]` - Empty array literal
  - Example:
    ```swift
    var someInts: [Int] = []
    ```
- `[Element]()` - Explicit initializer syntax
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
- Create an array literal with a list of values (of the same type), separated by commas and surrounded by brackets
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
  - To retrieve the index and value of each item in array, use the `enumerated` method to iterate over the array
    - Returns a tuple of the index and the value of each item in array
    - Example:
      ```swift
      var list = ["LeBron", "Jordan" "Kobe", "Wade", "Iverson"]
      for (index, item) in list.enumerated() {
        print("\(index + 1). \(item)")
      }
      ```
