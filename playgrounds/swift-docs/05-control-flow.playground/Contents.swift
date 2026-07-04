import UIKit

// ------------If Expression------------
let temp = 90
let description = if temp < 60 {
    "It's cold outside!"
} else if temp > 60 && temp < 80 {
    "It's pretty warm outside!"
} else {
    "It's hot as hell!"
}
print(description)

// ------------Continue Control Transfer------------
let randomLetters = "asldfjlsd"
let secretLetter: Character = "a"
for letter in randomLetters {
    if letter != secretLetter {
        continue
    }
    print("Found the secret letter")
}

// ------------Fallthrough------------
let price = 329.99
let taxes = 14.99
var total = price
switch price {
case let x where x <= 199.99:
    total += 29.99
case let x where x >= 299.99:
    total += 34.99
    fallthrough
default:
    total += taxes
}

print("$\(total)")

// ------------Labeled Statements------------
var count = 0
counter: while count < 13 {
  switch count {
    case 0:
      count += 4
    case let x where x >= 5:
      count += 5
      break counter
    default:
      count += 2
  }
}

print(count)

// ------------Guard Statements------------

func greet(person: [String: String]) {
    guard let name = person["name"] else {
      print("Hello nobody")
      return
    }

    guard let location = person["location"] else {
      print("I hope the weather is nice near you")
      return
    }

    print("Hello \(name). I hope it's nice in \(location).")
}

greet(person: ["name": "Elliot"])
greet(person: ["name": "Wilma", "location": "Atlanta"])
