# Constants and Variables

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
