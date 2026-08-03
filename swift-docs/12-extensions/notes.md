# Extensions

- Add new (but not override existing) functionality to an existing class, struct, enum, or protocol
- Things extensions can do:
  - Add computed properties
  - Define new methods
  - Provide new initializers
  - Conform the type to a protocol
- Use the `extension` keyword when defining an extension for a type
- Example:

  ```swift
  struct User {
    var id: Int
    var name: String
    var email: String
    var password: String

    init(id: Int, name: String, email: String, password: String) {
      self.id = id
      self.name = name
      self.email = email
      self.password = password
    }
  }

  extension User {
    func save() {
      // definition
    }

    func delete() {
      // definition
    }

    func edit() {
      // definition
    }
  }

  extension User {
    func isEmailValid() -> Bool {
      return email.contains("@")
    }

    func isPasswordString() -> Bool {
      return password.count >= 8
    }
  }
  ```

- Extensions enable you to organize code into logical sections
  - Related functionality is grouped together and has a single responsibility
  - Allows you to separate core functionality from convenience features
- Extensions allow you to have your type conform to protocols in an organized manner
  - This way, protocol conformance is isolated and clear
  - Example:

    ```swift
    protocol Displayable {
      func display() -> String
    }

    extension User: Displayable {
      func display() -> String {
        return "\(name) (\(email))"
      }
    }
    ```

- Throwing everything into a single class (or struct, enum, etc.) definition creates a **"God Object"** that can become unmaintainable
- Extensions can be split across multiple files to keep from a single file from growing too large
  - Each file will have one responsibility
  - Syntax: **Type+Responsibility.swift**
