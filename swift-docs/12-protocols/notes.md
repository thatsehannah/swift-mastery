# Protocols

- Defines a blueprint of methods, properties, and other requirements that conforming types must implement
  - Any type that satisfies the requirements of a protocol are **_conforming_**
  - A class, struct, or enum can conform to a protocol and provide an implementation of its requirements
- Protocols are the same as **interfaces** in other programming languages
- Defined using the `protocol` keyword, similarly to a class, struct, etc.
  - Example:
    ```swift
    protocol SomeProtocol {
      // definition
    }
    ```
- Types that conform to a protocol do so by placing the protocol name after the type's name, separated by a colon
  - Example:
    ```swift
    struct SomeStruct: SomeProtocol {
      // definition
    }
    ```
- Types can conform to multiple protocols, and are separated by commas
  - If a class inherits another class as well as conform to multiple protocols, the superclass goes first followed by the protocols, all separated by commas
    - Example:
      ```swift
      struct SomeClass: SomeSuperclass, SomeProtocol, AnotherProtocol {
        // definition
      }
      ```
  - To limit a protocol to only be conformed by class types, add the `AnyObject` protocol to its inheritance list
    - Example:
      ```swift
      protocol SomeClassOnlyProtocol: AnyObject, SomeProtocol {
        // definition
      }
      ```
- Protocols specify the name and type of a property and whether the property is readable or readable AND writable
  - <mark>Property requirements are always variables `var`</mark>
  - Readable and writable properties have `{ get set }` after their type definition
  - Readable properties have `{ get }` after their type definition
  - Example:

    ```swift
    protocol FullyNamed {
      var fullName: String { get }
    }

    struct Person: FullyNamed {
      var fullName: String
    }

    let john = Person(fullName: "John")
    ```

  - For type properties, prefix property requirements with the `static` keyword when defining them in a protocol
  - Methods can required the same way as properties
    - Are written as part of the protocol's definition without curly braces or a method body - just the name, any parameters, and the return type
    - Any method requirement that will modify the instance must have the `mutating` keyword as part of the protocol definition
    - Example:

      ```swift
      protocol Toggle {
        mutating func toggle()
      }

      enum OnOffSwitch: Toggable {
        case off, on

        mutating func toggle() {
          switch self {
            case .off:
              self = .on
            case .on:
              self = .off
          }
        }
      }

      var lightSwitch = OnOffSwitch.off
      print(lightSwitch) // off
      lightSwitch.toggle()
      print(lightSwitch) // on
      ```

- Can require initializers to be implemented by conforming types the same way as methods
  - For classes that conform to a protocol that requires an initializer, the required initializer is either a designated or convenience initializer, prefixed with the `required` keyword
  - Example:

    ```swift
    protocol Shape {
      init(color: String)
    }

    class Rectangle: Shape {
      var color: String

      required init(color: String) {
        self.color = color
      }
    }
    ```

## Semantic Requirements

- Requirements that tell how values of those types that conform to these types of protocols behave and about the operations they support
- Don't include method or property declarations, just implicit conformance
  - Some protocols are automatically inferred. To supress those protocols, write a tilde `~` before the protocol name when defining a struct or class
    - Example:
      ```swift
      struct File: ~Sendable {
        let fileName: String
      }
      ```

## Protocol Composition

- When a type conforms to multiple protocols at once by combining them into a single requirement for things like typing function parameters or typing a property
- Protocols are separated by an ampersand `&`
- Behave as a local protocol that combines all of the requirements of the protocols
- Example

  ```swift
  protocol Named {
    var name: String { get }
  }

  protocol Aged {
    var age: Int { get }
  }

  struct Person: Named, Aged {
    let name: String
    let age: Int
  }

  func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday \(celebrator.name). You're \(celebrator.age) years old.")
  }

  let birthdayPerson = Person(name: "Henry", age: 24)

  wishHappyBirthday(to: birthdayPerson)
  // Happy birthday Henry. You're 24 years old.
  ```

  - In the `wishHappyBirthday` function, it doesn't matter which specific type is passed, just as long as it conforms to the required protocols

- <mark>When using multiple protocols to define a type (struct, class, enum), use the conformance approach (separating by commas). When using multiple protocols as a specific type (method params, return type, variable type), use the composition approach (separating by ampersands)</mark>
