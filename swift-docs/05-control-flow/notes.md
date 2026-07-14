# Control Flow

## For-in Loop

```swift
for index in 1...5 {
  print("\(index) * 5 is \(index * 5)")
}
```

- Use an underscore `_` in place of the iteration variable if you don't need each value from the sequence
  - Example:
    ```swift
    let base = 3
    let power = 10
    var answer = 1
    for _ in 1...power {
      answer *= base
    }
    ```
- **Strides** - allow you to skip through a sequence using an interval
  - `stride(from:to:by:)` - similar to a half-open range (the `to` value is exclusive)
    - Example:
      ```swift
      let minutes = 60
      let minuteInterval = 5
      for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
        print(tickMark)
      }
      ```
  - `stride(from:through:by:)` similar to a closed range (the `through` value is inclusive)
    - Example:
      ```swift
      let hours = 12
      let hourInterval = 3
      for tickMark in stride(from: 0, through: hours, by: hourInterval) {
        print(tickMark)
      }
      ```

## While Loop

- Performs the set of statements until a single condition becomes `false`

```swift
let count = 0
while count < 8 {
  print(count)
  count++
}
```

## Repeat-While Loop

- Performs the set of statements _first_ before considering the loop's condition, then operates as a regular while loop

```swift
let count = 0
repeat {
  count++
  print(count)
} while count < 8
```

## `If` Expression

- When setting a value conditionally, use a special `if` syntax that sets the value on each branch
- All branches need to have contains values of the same type
- Example:
  ```swift
  let temp = 97
  let weatherAdvice = if temp <= 60 {
    "It's cold. Wear a jacket."
  } else if temp >= 90 {
    "It's hot af. Wear some sunscreen!"
  } else {
    "It's not that cold. You can wear a T-shirt."
  }
  ```

## Switch

```swift
let someChar: Character = "z"
switch someChar {
  case "a":
    print("First letter of the alphabet")
  case "z":
    print("Last letter of the alphabet")
  default:
    print("Some other letter")
}
```

- Switch statement finishes execution when the first matching case is completed without needing a `break` statement
- **Value binding** - When values a switch case matches to are bound to temporary constants/variables
  - Can be combined with a `where` clause to check for conditions
  - Example:
    ```swift
    let price = 329.99
    var total: Double
    switch price {
      case let x where x <= 199.00:
        total = price + 29.99
      case let x where x <= 299.99:
        total = price + 34.99
      default:
        total = price
    }
    ```
- Example of a switch statement with a **compound case**
  ```swift
  let anotherChar: Character = "a"
  switch anotherChar {
    case "a", "A":
      print("The letter A")
    default:
      print("Not the letter A")
  }
  ```
- Example of a switch statement using ranges
  ```swift
  let number = 62
  switch number {
    case: 0
      print("Nothing")
    case 1..<5:
      print("A few")
    case 5..<12:
      print("Several")
    case 12..<100:
      print("Plenty")
    default:
      print("Many")
  }
  ```

## Control Transfer Statements

### `Continue`

- Tells loop to end the current iteration and begin the next iteration
- Example:
  ```swift
  let randomLetters = "doifjaalsjk"
  let secretLetter = "k"
  for letter in randomLetters {
    if letter != secretLetter {
      continue
    }
    print("Found the secret letter!")
  }
  ```

### `Break`

- Tells loop to stop execution completely
- Can be used to ignore cases in a `switch` statement

### `Fallthrough`

- Causes code execution to move directly to the next case block
- Example:

  ```swift
  let price = 329.99
  let tax = 13.99
  var total = price
  switch price {
    case let x where x < 199.99:
      total += 29.99
    case let x where x > 299.99:
      total += 34.99
      fallthrough
    default:
      total += tax
  }
  ```

### `Label Statements`

- Explicitly identifies what loop or conditional to `break` or `continue`
- Indicated by placing a label on the same line as the statement's first keyword
- Example:
  ```swift
  let count = 0
  counter: while count < 10 {
    switch count {
      case 0:
        count += 5
      case let x where x >= 5:
        count += 5
        break counter
      default:
        count += 2
    }
  }
  ```

## Guard Statement

- Requires a condition must be true for the code after the `guard` statement to be executed
- Must have an `else` clause for when the condition is not true
- Example:

  ```swift
  func greet(person: [String: String]) {
    guard let name = person["name"] else {
      print("Hello nobody")
      return
    }

    guard let location = person["location"] else {
      print("I hope the weather is nice near you")
      return
    }

    print("Hello \(name). I hope it's nice in \(location).")
  }

  greet(person: ["name": "Elliot"])
  greet(person: ["name": "Wilma", "location": "Atlanta"])
  ```

## Defer

- Controls when a piece of code is executed
- Used to write code that will be executed when the program reaches the end of the current scope
- Code inside always runs
- When writing more than one `defer` block within same scope, the first one is the last one
- Useful for when you need to guarantee some actions execute regardless of how the code finishes within that scope
  - Does execute when an error is thrown but not when the code crashes
- Example:
  ```swift
  var score = 1
  if score < 10 {
    defer {
      print(score)
    }
    score += 3
  }
  ```
