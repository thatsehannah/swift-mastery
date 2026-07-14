# Functions

## Function definition

- Describes what the function does, what it expects to receive, and what it returns when it's done
- Function name prefixed with the `func` keyword
- One or more named, typed parameters
  - Parameters are constant by default
- Optionally, a type of value that the function will return as output preceded by a return arrow `->` (required if the function returns a value)
  - If the function doesn't return a value, the return arrow is not required.
- Example:
  ```swift
  func printAndCount(text: String) -> Int {
    print(text)
    return text.count
  }
  ```
- Can use a tuple to return multiple values compounded into one return value
  - Must be labeled in the function definition so they can accessed by name when retrieving the return value using dot notation
    - Labeling is not needed within the function body
  - Example:

    ```swift
    func firstAndLast(array: [Int]) -> (first: Int, last: Int) {
      let first = array[0]
      let last = array[array.count - 1]

      return (first, last)
    }

    let result = firstAndLast(array: [8, -6, 2, 200, 3, 71])
    let firstElement = result.first
    let lastElement = result.last
    ```

- The `return` keyword can be excluded if the function body is one expression (but has to return a value nonetheless)

## Function Argument Labels and Parameter Names

- Each function parameter has both an argument label and a parameter name
- **Argument label** - Used when calling a function
  - If a parameter has an argument label defined, the parameter must be labeled when calling the function
  - Used to allow a function to be called in a sentence-like format
- **Parameter name** - Used within the function body
- If no argument label is provided, parameter name is used when calling the function AND within the function body
- Argument labels go before parameter name
- Syntax:

  ```swift
  func someFunction(argumentLabel parameterName: Int) {
    // function body uses parameterName
  }

  someFunction(argumentLabel: 4)
  ```

- Use an underscore `_` in place of the argument label if you don't want to create an explicit argument label for the function definition
  - Example:

    ```swift
    func someFunction(_ parameterName: Int) {
      // function body uses parameterName
    }

    someFunction(1)
    ```

## Default Values

- Define default values by assigning a value to a parameter after the parameter's type
- When set, can be omitted when calling the function
- Must be placed at the end of the parameter list (non-default parameters placed at beginning of parameter list)
- Example:

  ```swift
  func someFunction(param1: Int, param2: Int = 12) {
    // ...
  }

  someFunc(param1: 8, param2: 8) // overrides the default value
  someFunc(param1: 9) // uses the default value
  ```

## Variadic Parameters

- Accepts zero or more values of a specific type
- Signify that the parameter can be passed a varying number of values when the function is called
- Write variadic parameters by inserting an ellipse `...` after the parameter's type name
- Used within the function body as an array of the type specified
- Example:

  ```swift
  func calculateMean(_ numbers: Double...) -> Double {
    var total: Double = 0.0
    for number in numbers {
      total += number
    }

    return total / Double(numbers.count)
  }

  calculateMean(1,2,3,4,5)
  ```

## In-Out Parameters

- A parameter that is passed in to the function, modified by the function, and passed back out of the function to replace the original value
- Allows you to modify the passed-in value and reflect those changes outside of the function's body
- Place the `inout` keyword right before the parameter's type
- When calling the function, the arguments that correspond to these `inout` parameters must be variables `var` not constants `let`
- Prefix the arguments with an ampersand `&`
- Can't have default values nor can be marked as variadic parameters
- When calling a function with `inout` parameters, prefix those parameters with an ampersand `&`
- Example:

  ```swift
  func swapValues(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
  }

  var player1 = 23
  var player2 = 6
  print("Before -> Player 1's value: \(player1), Player 2's value: \(player2)")
  swapValues(&player1, &player2)
  print("After -> Player 1's value: \(player1), Player 2's value: \(player2)")
  ```

## Function Types

- Made up of the parameter types and the return type of the function
  - "A function that has <x> parameters of type <y>, and returns a value of type <z>"
- Example:

  ```swift
  // (Int, Int) -> Int
  func addInts(_ a: Int, _ b: Int) -> {
    return a + b
  }

  // () -> Void
  func sayHello() {
    print("Hello, world")
  }
  ```

- Can be used a parameter type for another function
  - Gives function caller the flexibility to use a function of that type how it wants
  - Example:

    ```swift
    // (Int, Int) -> Int
    func addInts(_ a: Int, _ b: Int) -> Int {
      return a + b
    }

    // (Int, Int) -> Int
    func multiplyInts(_ a: Int, _ b: Int) -> Int {
      return a * b
    }

    func printResults(for mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
      print("Result: \(mathFunction(a, b))")
    }

    printResults(for: multiplyInts, 4, 3)
    printResults(for: addInts, 4, 3)
    ```

## Nested Functions

- Functions defined inside another function
- Only called from within their enclosing function
- Enclosing function can return a nested function to allow the nested function to be used globally (or within the enclosing function's parent scope)
- Example:

  ```swift
  func chooseArrayFunction(add: Bool) -> ([Int], Int) -> [Int] {
    func addToArray(input: [Int], valueToAdd: Int) -> [Int] {
        var newArray = input
        newArray.append(valueToAdd)
        return newArray
    }

    func removeFromArray(input: [Int], index: Int) -> [Int] {
        var newArray = input
        newArray.remove(at: index)
        return newArray
    }

    return add ? addToArray : removeFromArray
  }

  var array: [Int] = [3, 23, 24, 12, 8]
  print("current array: \(array)")

  var modifyArray = chooseArrayFunction(add: true)
  var newArray = modifyArray(array, 18)
  print("modified array (add): \(newArray)")

  modifyArray = chooseArrayFunction(add: false)
  newArray = modifyArray(array, array.count - 1)
  print("modified array (remove): \(newArray)")
  ```
