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
