# The Basics

## Constants and Variables

- Constants - can't be changed once it's set
- Variables - can be set to a different value in the future
- `let` - declares constants
  - let is for stored values that won't change
- `var` - declares variables
  - var is for storing values that change
- Example:
  ```swift
  let maxAttemps = 10
  var currentAttempt = 0
  ```
- Can assign an initial value to constant/variable immediately or declare it first then set the value later (as long as it's set before you use it)
  - Example:

    ```swift
    var env = "dev"
    let maxAttempts: Int

    if env == "dev" {
      maxAttempts = 100
    } else {
      maxAttempts = 10
    }
    ```

- Can declare multiple constants/variables on a single line, separated by comma
  - Example:
    ```swift
    var x = 0.0, y = 0.0, z = 0.0
    ```
- Type annotations - explicitly states what kind of values the constant/variable can store
  - Example:
    ```swift
    var message: String
    ```
- Can define multiple variables of the same type on a single line, separated by commas
  - Example:
    ```swift
    var red, green, blue: Double
    ```
- Constant/variable names cannot contain whitespace, math symbols, arrows, or begin with number (but can have numbers elsewhere within the name)
- print() function - prints the current value of a constant/variable
  - String interpolation - includes the name of of a constant/variable as a placeholder in a string and replaces it with the current of that constant/variable when printed
    - Wrap the name of constant/variable in parentheses and escape it with a backslash
    - Example:
      ```swift
      var name: "Elliot"
      print("Hello \(name)")
      ```

## Comments & Semicolons

- Comments are nonexecutable text within your code
- Are ignored by the compiler
- Begin with two forward-slashes

```swift
// This is a comment.
```

- Multiline comments - start with forward-slash followed by asterisk and end with an asterisk followed by a forward-slash
  - Example
    ```swift
    /* This a comment
    written over multiple lines. */
    ```
- Swift doesn't require you to write semicolons after each statement
- Semicolons are needed for writing multiple statements in one line
  - Example:
    ```swift
    let name = "Bob"; print(name)
    ```

## Integers

- Integers are whole numbers with no fractional component
- Suitable for counting and other calculations that represent exact amounts
- `Int` - the type you'll mostly use to for interger values
- Use **UInt** (unsigned integer type) only when you specifically need an unsigned integer type

## Floating-Point Numbers

- Have a fractional component
- `Double` - the type you'll mostly use to for floating-point values
- Have a not-a-number (NaN) value to represent invalid results, e.g. dividing by zero
  - NaN doesn't exist in the integer type (will stop the program if value can't be represented)

## Type Safety & Type Inference

- Swift is a **type-safe language**, which means you have to be explicit about the type a constant/variable can store
- Swift will check code for type safety and throw an error when types mismatch
- **Type inference** - when you don't specify a type for a constant/variable, Swift decides the type based on the initial value provided
  - Example:
    ```swift
    let count = 0
    // count is inferred to be of type Int
    ```

## Type Aliases

- Define an alternative name for an existing type
- Defined with `typealias` keyword
- Useful when you want to refer to type by a name that makes more sense for your program
- Can use the alias anywhere you'd use the original type
- Example:
  ```swift
  typealias AudioSample = UInt16
  var minimum = AudioSample.min // minimum equals 0
  ```

## Booleans

- `Bool` type
- Literal values can either be `true` or `false`
- Useful when working with conditional statements

## Tuples

- Group multiple values into a single compound value
- Values can be of any type (don't have to be of the same type)
- Example:

  ```swift
  let httpError = (404, "Not Found")
  ```

  - Described as a tuple of type (Int, String)

- Decomposing a tuple
  ```swift
  let (code, message) = httpError
  print("The status code is \(code)") //Prints "The status code is 404"
  ```
- Use an underscore `_` for the value you don't want when you're decomposing
  ```swift
  let (code, _) = httpError
  ```
- Access the individual element using index numbers starting from 0
  ```swift
  let code = httpError.0
  let message = httpError.1
  ```
- Useful as the return values of functions
- Useful for simple groups of related values

## Optionals

- Used in situations where a value may or may not exist
- Either there is a value or there isn't a value at all
- Write a question mark `?` after the name of the type
  - Example:
    ```swift
    var serverCode: Int? = 404
    ```
- `nil` - Special value that an optional is automatically set to when an optional does not have a default value
  - Use an if statement to check if an optional contains a value or is equal to `nil`
  - Can't use `nil` on non-optional constants/variables (will get a compile-time error)
- **Optional binding** - Used check for a value inside an optional and extract that value into a constant/variable
  - Syntax: `if let <#constantName#> = <#optional#> { }`
  - The constant/variable will be initialized with the value or not initialized at all
  - Example:

    ```swift
    let possibleValue = Int("12")
    if let actualNum = possibleValue {
      print("\"\(possibleValue)\" could be converted into an integer")
    } else {
      print("\"\(possibleValue)\" couldn't be converted into an integer")
    }
    ```

    - If the optional contains a value, set a constant called actualNum to the optional's value

  - If you know you won't need the optional after retrieving its value, you can use a shorthand syntax that will create a constant/variable with the same name as the optional that can be used in the if statement
    - Example:
      ```swift
      let myNumber = Int("12")
      if let myNumber {
        print("My number is \(myNumber)")
      }
      ```
  - **Nil-coalescing operator `??`** - Provides a default, fallback value.
    - Syntax: `<#optional#> ?? <#defaultValue#>`
    - If optional to the left doesn't have a value (nil), the value to the right is used.
    - Example
      ```swift
      let name: String? = nil
      let greeting = "Hello, " + (name ?? "person") + "!"
      ```
  - **Force unwrapping** - Accessing the underlying value of an optional
    - Add an exclamation mark `!` to the end of the optional's name
    - Implies that the optional will always have a value
    - Force unwrapping a `nil` value triggers a runtime error
    - **Implicit unwrapped optionals** - Optionals that will always have a value after it's first defined
      - Write an exclamation mark `!` after the type that you want to make optional
      - Useful when an optional's value is confirmed to exist immediately after it's fist defined and can be assumed to exist at every point thereafter
      - If you need to check for `nil` at any point, don't use implicit unwrapped optionals; use normal optional
      - The advantage: can be used like a non-optional value without the need to unwrap the optional each time it's accessed
      - Example:
        ```swift
        let text: String! = "An implicitly unwrapped optional string."
        let newText: String = text
        ```
