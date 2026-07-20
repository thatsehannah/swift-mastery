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

## Property Wrappers

- Adds a layer of separation between code that manages how a property is stored and the code that defines a property
- Encapsulates management logic (e.g. data validation, persistence) into a reusable object so you don't have to rewrite custom getters and setters across multiple properties
  - The management code is written once and then reused by applying it to multiple properties
- `@propertyWrapper` - attribute used when creating a property wrapper on a struct, class, or enum
  - Has to define a `wrappedValue` stored or computed property
    - Defines the underlying value being managed
- Apply a wrapper to a property of a struct, class, or enum by writing the wrapper's name before the property as an attribute
- Example:

  ```swift
  @propertyWrapper
  struct Uppercased {
    private var name: String = ""
    var wrappedValue: Int {
      get { return name }
      set { name = newValue.uppercased() }
    }
  }

  struct User {
    @Uppercased var firstName: String
    @Uppercased var lastName: String
  }

  var user = User()
  user.firstName = "elliot"
  print(user.firstName) // ELLIOT
  ```

## Type Properties

- Properties that belong to a type, not to any one instance of that type
- Only one copy of the properties, no matter the amount of instances of that type created
- Universal to all instances of a particular type
- Similar to `static` variables in other languages
- Must have a default value because there's no way for a type to assign a value at initialization time
- Written as part of the type's definition using the `static` keyword
  - For computed properties of class types, use the `class` keyword (instead of `static`) to make the property overrideable
- Values are set and accessed via dot syntax on the type
- Example:

  ```swift
  struct SomeStruct {
    static var storedProp = "Some Value"

  }

  print(SomeStruct.storedProp)


  ```

## Methods

- Functions associated with a particular type
- **Instance methods** - functions that belong to instances of a particular that provide functionality that either access and modify instance properties, or provide functionality related to the instance's purpose
- **Type methods** - functions that are called on the type itself
  - Indicated by the `static` keyword before the method's `func` keyword
  - Can call another type method or access type properties within the method's definition without using prefixing the type's name
  - For class types, use the `class` keyword instead of `static`
- `mutating` - keyword used on instance methods that allow you to modify the properties of a struct within the method itself
  - Structs are value types and their properties can't be modified from within its methods
  - Example:

    ```swift
    struct Point {
      var x = 0.0., y = 0.0
      mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
      }
    }

    var somePoint = Point(x: 1.0, y: 2.0)
    somePoint.moveBy(x: 4.0, y: 3.0)

    print("x: \(somePoint.x), y: \(somePoint.y)")
    ```

## `self` Property

- Implicit property every instance has that is equivalent to the instance itself
- Use this property to refer to the current instance within its own instance methods
- If `self` isn't written explicitly, Swift automatically assumes you're referring to property or method of the current instance anyway
  - When a parameter in an instance method has the same name as a property of that instance, use the `self` property to distinguish between the parameter and property
    - Example:

      ```swift
      struct Point {
        var x = 0.0, y = 0.0
        func isToTheRightOf(x: Double) -> Bool {
          return self.x > x
        }
      }

      let somePoint = Point(x: 5.0, y: 5.0)
      if (somePoint.isToTheRightOf(x: 3.0)) {
        print("True")
      } else {
        print("False")
      }
      ```

## Subscripts

- Used to set and retrieve values by index without needing separate methods
- Allow you to query instances of a type by writing one or more values in square brackets after the instance name
- Syntax (similar to instance methods)
  - `subscript` keyword
  - One or more input parameters
  - Return type
  - Can be either read-write (getter & setter) or read-only (getter) like a computed property
  - Example:

    ```swift
    struct Person {
      var name: String
      var age: Int

      subscript(key: String) -> String? {
        get {
          if key == "name" { return name }
          if key == "age" { return age }
          return nil
        }
      }
    }

    let person = Person(name: "Elliot", age: 32)
    print(person["name"]) // Elliot
    print(person["age"]) // 32
    ```

- Let you access data using familiar bracket notation instead of method calls
  - Example (without subscripts):

    ```swift
    class PhoneBook {
      private var data: [String: String] = [:]
      func getNumber(forContact key: String) -> String? {
        return data[key]
      }

      func setNewNumber(_ value: String, name key: String) {
        data[key] = value
      }
    }

    let phoneBook = PhoneBook()
    phoneBook.setNewNumber("2135557415", name: "Ghost")
    let number = phoneBook.getNumber(forContact: "Ghost")
    ```

  - Example (with subscripts):

    ```swift
    class PhoneBook {
      private var data: [String: String] = [:]

      subscript(key: String) -> String? {
        get { return data[key] }
        set(newNumber) { data[key] = newNumber }
      }
    }

    let phoneBook = PhoneBook()
    phoneBook["Ghost"] = "2135557415"
    let number = phoneBook["Ghost"]
    ```

- **Subscript overloading** - Classes and structs can implement as many subscripts as needed, inferred based on the type and values provided at the point the subscript is used

## Inheritance

- When a class inherits methods, properties, etc. from another class and provides their own implementation to those characteristics to refine the behavior as well as add their own methods, properties, etc.
- **Subclass** - The class that inherits from another class
- **Superclass** - The class that a subclass inherits from
- **Base class** - Class that doesn't inherit from another class
  - Classes defined without specifying a superclass automatically become a base class
- When defining a new class, write the subclass before the superclass, separated by a colon

  ```swift
  class Subclass: Superclass {
    // definition
  }
  ```

- Example:

  ```swift
  class Vehicle {
    var currentSpeed: Double = 0.0
    var description: String {
      return "traveling at \(currentSpeed) mph"
    }
  }

  class Bicycle: Vehicle {
    var hasBasket = false
  }

  let bike = Bicycle()
  bike.currentSpeed = 15.0
  bike.hasBasket = true
  print(bike.description)

  ```
