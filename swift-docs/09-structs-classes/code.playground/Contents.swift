import Cocoa

// -------------Read-only Computed Properties-------------
struct Employee {
    var firstName: String
    var middleName: String
    var lastName: String
    
    var fullName: String {
        get {
            "\(firstName) \(middleName[middleName.startIndex]). \(lastName)"
        }
        
    }
}

let developer1 = Employee(firstName: "David", middleName: "Christopher", lastName: "Jones")
print(developer1.fullName)

// -------------Read-write Computed Properties-------------
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

var box = Square(side: 4)
print(box.area)

box.area = 25
print(box.side)

// -------------Property Observers-------------
class StepCounter {
    var totalSteps: Int = 0 {
      willSet(moreSteps) {
        print("About to add \(moreSteps) steps")
      }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
        
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 250
stepCounter.totalSteps = 261
