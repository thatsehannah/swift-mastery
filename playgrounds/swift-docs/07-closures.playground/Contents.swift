import UIKit

// ----------------Capturing Variables----------------
var count = 0

let increment = {
    count += 1
}

increment()
increment()
print(count)

print("---------------------")

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
  var runningTotal = 0
  func incrementer() -> Int {
    runningTotal += amount
    return runningTotal
  }

  return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
var result = incrementByTen()
print(result) // 10

result = incrementByTen()
print(result) // 20

result = incrementByTen()
print(result) // 30

let incrementBySix = makeIncrementer(forIncrement: 6)
result = incrementBySix()
print(result) // 6

result = incrementBySix()
print(result) // 12

result = incrementByTen()
print(result) // 40

print("---------------------")

// ----------------Trailing Closures----------------
let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let nums = [23, 66, 1089]

let strings = nums.map { (num) -> String in
    var number = num
    var string = ""
    repeat {
        string = digitNames[number % 10]! + string
        number /= 10
    } while number > 0
    return string
}

print(strings)
print("---------------------")



