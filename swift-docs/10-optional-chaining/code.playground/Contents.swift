import Cocoa

class Residence {
    var numberOfRooms = 5
}

class Person {
    var residence: Residence?
}

let john = Person()
john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) rooms")
} else {
    print("Unable to retrieve the number of rooms")
}
