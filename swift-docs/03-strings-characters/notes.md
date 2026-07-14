# Strings & Characters

## String Literals

- A sequence of characters surrounded by double quotation marks `"`
- Use three double quotation marks for strings that span several lines (multiline string literal)
  - Example:

    ```swift
    let quote = """
    The White Rabbit put on his spectacles. "Where shall I begin, \
    please your Majesty?" he asked.

    "Begin at the beginning," the King said gravely, "and go on \
    till you come to the end; then stop."
    """
    ```

    - Use a backslash `\` to insert a line break on a line in a multiline string literal

- Escape characters
  - `\0` - null character
  - `\\` - backslash
  - `\t` - horizontal tab
  - `\n` - new line
  - `\"` - double quotation mark
  - `\'` - single quotation mark
  - Example:
    ```swift
    let sentence = "My favorite Larry June song is \"I Ain\'t Stoppin\'\"
    ```

## Empty Strings

- Use initializer syntax `String()` or `""` to create an empty string
- `isEmpty` - property that checks if a `String` variable is empty

## Characters

- `Character` values must contain a single character only
- Loop over a `String` by iterating over it to access the individual characters
- Create a `Character` constant/variable by assigning it a single-character string literal
- Example:
  ```swift
  let exclamationMark: Character = "!"
  ```

## Concatenation

- `String` values can be added together with the addition operator `+` or with the addition assignment operator `+=`
- Example
  ```swift
  let string1 = "hello"
  let string2 = "world"
  var welcome = string1 + " " + string2
  ```

## Counting Characters

- `count` - property that counts the total number of `Character` values in a string
- Example:
  ```swift
  let text = "abcdefghijklmnop"
  print("The text has \(text.count) characters")
  ```

## Accessing and Modifying A String

- Strings have an index type (`String.Index`) that correspond to the position of each `Character` in the string
  - Index type is not a number; it's its own type
- `startIndex` - property that accesses the first character
  - Example:
    ```swift
    let string = "Hello"
    string[string.startIndex] // H
    ```
- `endIndex` - property that accesses the position after the last character
  - Not used in subscript
- `index(before:)` - property that accesses the character before a given index
- `index(after:)` - property that accesses the character after a given index
  - Example:
    ```swift
    let greeting = "Hello"
    greeting[greeting.index(before: greeting.endIndex)] // o
    greeting[greeting.index(after: greeting.startIndex)] // e
    ```
- `index(_:offsetBy:)` - accesses a character further away from a given index
  - Example:
    ```swift
    let greeting = "Guten Tag!"
    let index = greeting.index(greeting.startIndex, offsetBy: 7)
    greeting[index] //a
    ```
- `indicies` - property that accesses all of the indicies of each character

## Inserting and Removing

- `insert(_:at:)` - method that inserts a single character at a specified index
- `insert(contentsOf:at:)` - method that inserts another string at a specified index
  - Example:

    ```swift
    var welcome = "hello"
    welcome.insert("!", at: welcome.endIndex) // hello!

    welcome.insert(contentsOf: "there", at: welcome.index(before: welcome.endIndex)) // hello there!
    ```

- `remove(at:)` - method that removes a single character at a specified index
- `removeSubrange(_:)` - method that removes a substring at a specific range
  - Example:

    ```swift
    let welcome = "hello there!"
    welcome.remove(at: welcome.index(before: welcome.endIndex)) // hello there

    let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex // starting from the 6th character from the end (the space) to the last character of the string (e)
    welcome.removeSubrange(range)
    ```

## Substrings

- When extracting a substring from a string, the result is of type `Substring`, not `String`
- `Substring` has same methods as `String`
- To use a `Substring`, convert it to a `String` and store it
- Example:

  ```swift
  let greeting = "Hello, World!"
  let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
  let beginning = greeting[..<index]

  let newString = String(beginning)
  ```

- The original string a substring was derived from must be kept in memory while using the substring throughout the program

## Prefixes and Suffixes

- `hasPrefix(_:)` - method that checks if a string has a particular prefix
- `hasSuffix(_:)` - method that checks if a string has a particular suffix
- Both take string argument and returns true or false
