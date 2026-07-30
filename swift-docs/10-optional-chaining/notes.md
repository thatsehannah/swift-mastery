# Optional Chaining

- The process for querying and calling properties and methods on an optional
- If optional contains a value, the call succeeds, otherwise returns `nil`
- Specified by placing a question mark `?` after the optional value
- Result of optional chaining is always an optional value
- Multiple queries can be chained together and the entire chain fails if any query returns `nil`
- Example:

  ```swift
  class Residence {
    var numberOfRooms = 1
  }

  class Person {
    var residence: Residence?
  }

  let john = Person()
  //john.residence = Residence() // makes the numberOfRooms property accessible in the if statement below

  if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) rooms")
  } else {
    print("Unable to retrive the number of rooms")
  }
  ```
