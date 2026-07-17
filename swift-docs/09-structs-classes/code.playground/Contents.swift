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

// -------------Property Wrappers-------------
@propertyWrapper
struct Uppercased {
    private var name: String = ""
    
    var wrappedValue: String {
        get { name }
        set { name = newValue.uppercased() }
    }
}

struct User {
    @Uppercased var firstName: String
    @Uppercased var lastName: String
}

var user = User()
user.firstName = "elliot"
print(user.firstName)

// ------------------------------------------
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { number }
        set { number = min(newValue, 12)}
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)

rectangle.width = 13
print(rectangle.width)

rectangle.height = 8
print(rectangle.height)

// -------------Type Properties-------------
struct SomeStruct {
    static let someProp: String = "Some prop"
}

print(SomeStruct.someProp)

// -------------Instance methods-------------
struct BasketballPlayer {
    var totalPoints = 0
    mutating func add(points: Int) {
        totalPoints += points
    }
}

var kobe = BasketballPlayer(totalPoints: 32000)
print(kobe.totalPoints)
kobe.add(points: 45)
print(kobe.totalPoints)


// -------------Self Property-------------
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 5.0, y: 5.0)
if somePoint.isToTheRightOf(x: 2.0) {
    print("True")
} else {
    print("False")
}
