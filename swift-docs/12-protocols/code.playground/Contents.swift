import Cocoa

// -------------------Property Requirements-------------------

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Jones")
print("John's name is \(john.fullName)")

struct HospitalEmployee: FullyNamed {
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var surgeon = HospitalEmployee(name: "James St. Patrick", prefix: "Dr.")
var nurse = HospitalEmployee(name: "Tommy Egan")

print(surgeon.fullName)
print(nurse.fullName)

// -------------------Method Requirements-------------------
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case on, off
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
print(lightSwitch)
lightSwitch.toggle()
print(lightSwitch)

// -------------------Protocol Composition-------------------
protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct BirthdayPerson: Named, Aged {
    let name: String
    let age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday \(celebrator.name)! You're \(celebrator.age) years old.")
}

let birthdayPerson = BirthdayPerson(name: "Henry", age: 24)

wishHappyBirthday(to: birthdayPerson)
