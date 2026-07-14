# Structs & Classes

- Structs and classes share the following capabilities:
  - Define properties to store values
  - Define methods to provide functionality
  - Creating an object of either is called an **instance**
  - Define subscripts to provide access to their values (using subscript syntax)
  - Define initializers to set up the initial state for new instances
  - Be extended to expand their functionality beyond their default implementation
  - Conform to protocols to provide standard functionality of a certain kind
- Classes specifically have the following capabilities:
  - Inherit characteristics from another class
  - Type casting
  - Deinitializers (allow you to free up resources associated with an instance of a class)

## Syntax

- Structs begin with the `struct` keyword and classes begin with the `class` keyword
  - Define a new type when created
  - Names are **upper camel case (e.g. UpperCamelCase)** and properties & methods are **lower camel case (e.g. lowerCamelCase)**
- Example:

  ```swift
  struct Resolution {
      var width = 0
      var height = 0
    }

    class VideoMode {
      var resolution = Resolution()
      var frameRate = 0.0
      var name: String?
    }
  ```

## Creating Instances

- Use initializer syntax to create new instances
  - Name of the struct/class followed by empty parentheses
- Use dot syntax to access the properties and subproperties of an instance or to assign a new value to a property
  - Example:

    ```swift
    let resolution = Resolution()
    let videoMode = VideoMode()

    let width = resolution.width
    let height = videoMode.resolution.height
    ```

- Structs have a memberwise initializer by default, where initial values for properties of a new instance can be set by the property name
  - Example:
    ```swift
    let vga = Resolution(width: 800, height: 900)
    ```
  - Class do not have memberwise initializers

## Value & Reference Types

- Structs are value types; they're copied when assigned to a constant/variable or passed to a function
  - Changing the value of a property of the copied instance will not be reflected in the original instance
  - Enums and basic types are structs behind the scenes

- Classes are reference types; they're not copied when assigned to constant/variable or passed to a function
  - A reference to the existing instance is used, so when an instance of one class is assigned to another constant/variable, they both point to the same instance
  - Changing the value of a property of the copied instance will be reflected in the original instance
  - **Identity operators** are useful to check whether two constants/variables refer to the same instance of a class
    - `===` - identical to
    - `!==` - not identical to
      - Note: identical to is not the same as equal. Identical to means two constant/variables refer to the same instance. Equal to means two constant/variable are equal in value

## Stored Properties

- A constant/variable that's stored as part of an instance
- Can contain default values
- Can be modified during initialization (even constant `let` properties)
- If an instance of a struct is a constant, the properties cannot be modified (even properties defined as variables `var`)
  - For an instance of a class, the properties can be modified even if the instance is a constant `let`
- **Lazy stored property** - The initial value isn't calculated until its first use
  - Indicated by the `lazy` keyword before declaration
  - Must always be variable `var`, not a constant `let`, because value might not be retrieved until after initialization
  - Useful when the initial value is dependent on unknown, outisde factors
- **Computed property** - provides a getter and setter to retrieve and set other properties indirectly
  - Don't store a value directily
  - Must be declared as variables `var`
  - Must declare the type (no type inference)
  - **Read-only computed properties**
    - Provides a getter `get` but no setter
    - Returns a value based on other stored properties
    - Cannot be assigned a new value
    - Useful for deriving a new value from existing stored properties
    - Example:

      ```swift
      struct Employee {
        var firstName: String
        var middleName: String
        var lastName: String

        var fullName: String {
          get {
            return "\(firstName) \(middleName[middleName.startIndex]). \(lastName)")
          }

        }
      }

      let developer1 = Employee(firstName: "David", middleName: "Christopher", lastName: "Jones")
      print(developer1.fullName) // David C. Jones
      ```

      - In this example, the `get` and `return` keywords can be omitted for simplification

  - **Read-write computed properties**
    - Includes both a getter `get` and a setter `set`
    - Setter allows you to update stored properties (those involved with the getter) indirectly
      - Setter provides an implicit parameter `newValue` that represents the new value to be set
        - Can be explicitly named to something else when declaring the setter `set` block
    - Example:

      ```swift
      struct Square {
        var side: Double

        var area: Double {
          get {
            side * side
          }

          set(incomingValue) {
            side = sqrt(incomingValue)
          }
        }
      }

      var box = Square(side: 4.0)
      print(box.area) // 16.0

      box.area = 25.0
      print(box.side) // 5.0
      ```

## Property Observers

- Observe and respond to changes in a property's value
- Called every time a property's value is set
- Added to stored properties that are defined in a struct/class, stored properties that are inherited, and computed properties that are inherited
  - For inherited properties, add a property observer by overriding that property in the subclass
  - For computed properties, use the setter `set`
- `willSet` - called before the value is stored
  - Passed the new value that you can specify a name for or use the default name `newValue` parameter name
- `didSet` - called after the new value is stored
  - Passed the old value that you can specify a name for or use the default `oldValue` parameter name
- Example:

  ```swift
  class StepCounter {
    var totalSteps: Int = 0 {
      willSet(moreSteps) {
        print("About to add \(newTotalSteps) steps"
      }
      didSet {
        if (totalSteps > oldValue) {
          print("Added \(totalSteps - oldValue) steps")
        }
      }
    }
  }

  let stepCounter = StepCounter()
  stepCounter.totalSteps = 200 // About to add 200 steps; Added 200 steps
  stepCounter.totalSteps = 360 // About to add 360 steps; Added 160 steps
  stepCounter.totalSteps = 250 // About to add 250 steps
  stepCounter.totalSteps = 261 // About to add 261 steps; Added 11 steps
  ```
