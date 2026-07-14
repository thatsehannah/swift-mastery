# Closures

- Self-contained blocks of functionality that can be passed around throughout your code
- Global functions are a type of closure that have a name and don't capture values
- Nested functions are a type of closure that have a name and can capture values from their enclosing function
- **Closure expressions** are a type of closure that DON'T have a name but can capture values from the surrounding context

## Closure Expressions

- Shorter way of writing a function without a full declaration and name
- Useful when working with functions that take other functions as arguments
- Syntax

  ```swift
  { (<#parameters#>) -> <#return type#> in
    <#statements#>
  }
  ```

  - Things to note:
    - The parameters and return type are written inside the curly braces
    - `in` keyword indicates that the closure's body is about to begin

- Example:

  ```swift
  let names = ["Chris", "Daren", "Wilma", "Ernestine", "Danielle"]
  let reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
  })
  ```

  - Code explanation:
    - `sorted(by:)` is a method that accepts a closure to sort an array

## Alternative Ways To Write Closure Expressions

- **Type Inference** - The parameter types and the return types can be inferred when passing a closure to a function or method as an inline closure expression, therefore omitting the parentheses and return arrow `->`
  - This is optional of course
  - Example:
    ```swift
    reversedNames = names.sorted(by: { s1, s2 in return s1 > s2} )
    ```
- **Implicit Return** - Single expression closures can omit the `return` keyword
  - Example:
    ```swift
    reversedNames = names.sorted(by: { s1, s2 in s1 > s2} )
    ```
- **Shorthand Argument Names** - refer to the values of the closure's arguments without explicitly defining an argument list
  - Each argument is prefixed with a dollar sign `$` and starts from 0 (`$0`, `$1`, and so on)
  - Using this shorthand syntax means you will be omitting the argument list from the closure definition
  - Type of the argument is inferred
  - Highest numbered shorthand argument determines the number of arguments the closure takes
  - `in` keyword is omitted
  - Example:
    ```swift
    reversedNames = names.sorted(by: { $0 > $1 } )
    ```
- **Trailing Closures** - Used when a closure is a function's final argument
  - Written after the function call's parentheses
  - If the closure body is a single line, the argument label for the closure is omitted
    - Example:
      ```swift
      reversedNames = names.sorted() { $0 > $1 }
      ```
    - If a closure is a function's only argument and the closure body is a single line, the parentheses can be omitted when calling the function
      - Example:
        ```swift
        reversedNames = names.sorted { $0 > $1 }
        ```
  - Trailing closures are useful when the closure itself is long and not possible to write on a single line
    - Example:

      ```swift
      let digitNames = [
      0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
      ]

      let nums = [23, 66, 1089]

      let strings = nums.map { (num) -> String in
          var number = num
          var string = ""
          repeat {
              string = digitNames[number % 10]! + string
              number /= 10
          } while number > 0
          return string
      }

      print(strings)
      ```

      - Code explanation:
        - `map(_:)` is an array method takes a closure as its single argument, is called once for each element in array, and returns a new value (possibly of another type) for that element. Method returns a new array containing all of the new values
        - Trailing closure is used to convert an array of numbers into an array of string values that are textual representations of each number
        - Inside closure expression
          - `number` is initialized with the value of the closure's `num` parameter.
          - A string called `string` is built by calculating the last digit of `number` using modulo (`number % 10`) and uses this digit as the key when obtaining the string value from the `digitNames` dictionary.
          - The value retrieved from `digitNames` is added to the front of `string`, building a string version of the element in the array in reverse
          - The `number` variable is then divided by 10 which simply removes the last digit in the number (23 / 10 = 2, 66 / 10 = 6, 1089 / 10 = 108)
          - Process is repeated until `number` equals 0 (after there are no more numbers to divide 10 by)
          - Once process is done, `string` is returned

  - If a function takes multiple trailing closues, omit the first trailing closure's argument label and label the remaining ones

## Capturing Values

- When a closure refers to and modifies the values of a constant/variable (that is defined outside of its scope) from within its body
- When a closure captures a constant/variable, it captures a reference to the constant/variable, not the value
- Example:

  ```swift
  var count = 0

  let increment = { count += 1 }

  print(count)
  increment()
  print(count)
  increment()
  print(count)
  ```

  - `count` starts at 0
  - Closure captures the variable `count`, not the value 0
  - When `increment` is called, it modifies the `count` variable itself
  - Every time `increment` is called, `count` changes

- Simplest form is a nested function
  - Example:

    ```swift
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
      var runningTotal = 0
      func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
      }

      return incrementer
    }

    let incrementByTen = makeIncrementer(forIncrement: 10)
    var result = incrementByTen()
    print(result) // 10

    result = incrementByTen()
    print(result) // 20

    result = incrementByTen()
    print(result) // 30

    let incrementBySix = makeIncrementer(forIncrement: 6)
    result = incrementBySix()
    print(result) // 6

    result = incrementBySix()
    print(result) // 12

    result = incrementByTen()
    print(result) // 40
    ```

    - Code explanation:
      - `incrementer()` captures a reference to `runningTotal` and `amount` from the outer function
      - Ensures that `runningTotal` and `amount` don't disappear after calling `makeIncrementer()` ends

## Closures Are Reference Types

- If you assign a closure to two different constants/variables, both of those refer to the same closure because when assigning a closure to a constant/variable, it is being set to be a **reference** to the closure
  - Doesn't create independent copies of the closure
- Example (continuing from **Capturing Values** example above):

  ```swift
  let anotherIncrementByTen = incrementByTen()
  result = anotherIncrementByTen()
  print(result) // 50

  result = incrementByTen()
  print(result) // 60
  ```

## Escaping Closures

- A closure that is passed to a function that is executed after the function it was passed to finish executing
- Marked with the `@escaping` keyword before the parameter's type
- Escaping closures outlive the function they are defined in
  - By default, closures are non-escaping, which means they are closures that are used within the function
- Lifecycle: The function starts -> The closure is saved somewhere (e.g. variable or an async queue) -> The function finishes and returns -> time passes -> the closue executes
- Example:

  ```swift
  func someFunc(closure: @escaping () -> Void) {
    print("1. Function starts")

    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      closure() // Runs 2 seconds later
    }

    print("2. Function ends (closure hasn't run yet)")
  }

  someFunc { print("3. Closure runs 2 seconds later") }
  print("4. After someFunc finishes")

  // 1. Function starts
  // 2. Function ends (closure hasn't run yet)
  // 4. After someFunc finishes
  // 3. Closure runs 2 seconds later
  ```

- When a function starts an asynchronous task (e.g. network request or a timer) and returns immediately, this function will have a completion handler (escaping closure) that will be executed later when the async task finishes
