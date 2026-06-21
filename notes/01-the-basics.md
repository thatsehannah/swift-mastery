# The Basics

## Constants and Variables

- Constants - can't be changed once it's set
- Variables - can be set to a different value in the future
- **let** - declares constants
  - let is for stored values that won't change
- **var** - declares variables
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
- **Int** - the type you'll mostly use to for interger values
- Use **UInt** (unsigned integer type) only when you specifically need an unsigned integer type

## Floating-Point Numbers

- Have a fractional component
- **Double** - the type you'll mostly use to for floating-point values
- Have a not-a-number(NaN) value to represent invalid results, e.g. dividing by zero
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
- Defined with **typealias** keyword
- Useful when you want to refer to type by a name that makes more sense for your program
- Can use the alias anywhere you'd use the original type
- Example:
  ```swift
  typealias AudioSample = UInt16
  var minimum = AudioSample.min // minimum equals 0
  ```

## Booleans

- **Bool** type
- Literal values can either be _true_ or _false_
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
- Use an underscore (\_) for the value you don't want when you're decomposing
  ```swift
  let (code, _) = httpError
  ```
- Access the individual element using index numbers starting from 0
  ```swift
  let code = httpError.0
  let message = httpError.1
  ```
