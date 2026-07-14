# Basic Operators

## Comparison Operators on Tuples

- Can compare two tuples if they have the same type and same number of values
- Compared from left to right, one value at a time until the comparison finds two values that aren't equal
  - Result of that comparison determines the overall result of the tuple comparison
- Example:
  ```swift
  (1, "zebra") < (2, "apple") // true because 1 is less than 2, nothing else is compared
  (3, "apple") < (3, "bird") // true because 3 is equal to 3, and "apple" is less than "bird"
  ```
- If one of the tuple's values is of type `Bool`, you can't compare them because some operators (`<`, `>`) can't be applied to `Bool` values
- Can only compare tuples with a max of seven elements

## Ternary Conditional Operator

- Syntax: `conditional ? result1 (if true) : result2 (if false)`
- If the `conditional` is true, it evaluates `result1` and returns its value; otherwise `result2` is evaluated and returned
- Shorthand for `if-else` checks

## Range Operators

- **Closed range operator** - `a...b`
  - Defines a range that runs from `a` to `b` and includes both `a` and `b`
  - Useful when iterating over a range where you want to use all of the values
  - Example:
    ```swift
    for index in 1...6 {
      print(index)
    }
    // prints out 1,2,3,4,5,6
    ```
- **Half-open range operator** - `a..<b`
  - Defines a range that runs from `a` to `b` but _doesn't_ include `b`
  - Useful when working with arrays where you're counting up from the 0th index to the final index (aka the length of the array minus 1)
  - Example:
    ```swift
    for index in 1..<6 {
      print(index)
    }
    // prints out 1,2,3,4,5
    ```
- **One-sided ranges** - `...a` or `a...`
  - Allows you to omit the value from one side of the operator
  - Useful in subscripts in arrays
  - Can be used alternatively to closed range or half-open range
  - Example:

    ```swift
    let names = ["Ronnie", "Bobbie", "Ricky", "Mike", "Ralph"]
    for name in names[2...] {
      print(name)
    }
    // prints out Ricky, Mike, Ralph

    for name in names[..<2] {
      print(name)
    }
    //prints Ronnie, Bobbie
    ```

  - Can't iterate over a one-side range that omits its first value but can iterate over one that omits the final value
