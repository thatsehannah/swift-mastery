# Enumerations

- Defines a type for a group of associated values
  - Each enum defintion defines a new type
- Syntax
  - Start with `enum` keyword
  - Name should be singular (e.g. Direction, not Directions)
  - Values defined in an enum start with the `case` keyword
  - Example:
    ```swift
    enum CompassPoint {
      case north
      case south
      case east
      case west
    }
    ```
  - Cases can also be written on one line
    ```swift
    enum CompassPoint {
      case north, south, east, west
    }
    ```
- Setting a variable to value from an enum

  ```swift
  enum CompassPoint {
    case north, south, east, west
  }

  var directionToHead = CompassPoint.south
  ```

  - `directionToHead`'s type is inferred, meaning the type can be dropped and dot syntax can be used to set it to different value of `CompassPoint`
    ```swift
    directionToHead = .north
    ```

- To iterate over an enum, make it conform to the `CaseIterable` protocol by writing `: CaseIterable` after the enum's name
  - This unlocks the `allCases` property that contains all of the cases in the enum and makes them available in a single collection
  - Example:

    ```swift
    enum Beverage: CaseIterable {
      case coffee, tea, juice
    }

    for beverage in Beverage.allCases {
      print(beverage)
    }
    ```

## Associated Values

- Useful when you need to store values of other types alongside an enum's case values
- Varies each time that case is used
- Value types can be different for each case of enum
- Example:

  ```swift
  enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
  }

  var productBarcode = Barcode.upc(8, 85909, 51226, 3)
  ```

  - Associated value of the `upc` case is a tuple of type `(Int, Int, Int, Int)` and the associated value of the `qrCode` case a `String`

- When using a `switch` statement on an enum with associated values, each associated value is extracted as a constant/variable to use within the case body of the `switch` statement
  - Example:

    ```swift
    enum Barcode {
      case upc(Int, Int, Int, Int)
      case qrCode(String)
    }

    var productBarcode = Barcode.upc(8, 85909, 51226, 3)

    switch productBarcode {
      case let .upc(numberSystem, manufacturer, product, check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
      case let .qrCode(productCode):
        print("QR Code: \(productCode)")
    }
    ```

    - Remember, when using `switch` statements, it has to be exhaustive. So either provide all of the cases from the enum or only provide what you need and include a `default` case

## Raw Values

- Default values that are of the same type
- Each raw value must unique
- Raw value is declared when you define the enum
- Difference between raw values and associated values
  - Raw value is picked when the enum is defined, and the raw value is always the same
  - Associated values are picked when a new constant/variable is created using an enum's case, and each value is different each time
- Accessible through the case's `rawValue` property
- Don't have to assign a raw value for every case when explicitly defining raw vales
  - The implicit value for integers is one more than the previous case
    - If no value is set for the first case, raw value for it is 0
  - The implicit value for strings is just the text of the case's name
- Example:

  ```swift
  enum Planet: Integer {
    case mercury, venus, earth = 4, mars, jupiter, saturn, uranus, neptune
  }

  print(Planet.earth.rawValue) // 4
  print(Planet.venus.rawValue) // 1
  print(Planet.mars.rawValue) // 5
  ```

- For enums with a raw-value type, an initializer is available that takes a parameter called `rawValue`; returns either a case or `nil` (makes the constant/variable being initialized an optional)
  - Example:
    ```swift
    let planet = Planet(rawValue: 4)
    ```
