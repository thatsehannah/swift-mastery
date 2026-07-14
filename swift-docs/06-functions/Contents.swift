import UIKit

// ---------------Returning a tuple---------------
func firstAndLast(array: [Int]) -> (first: Int, last: Int) {
    let first = array[0]
    let last = array[array.count - 1]
    
    return (first, last)
}

let result = firstAndLast(array: [8, -6, 2, 200, 3, 71])
print(result.first)
print(result.last)

// ---------------Variadic Parameters---------------
func calculateMean(_ numbers: Double...) -> Double {
    var total: Double = 0.0
    for num in numbers {
        total += num
    }
    
    return total / Double(numbers.count)
}

let mean = calculateMean(1,2,3,4,5)
print(mean)

// ---------------In-Out Parameters---------------
func swapValues(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

var player1 = 23
var player2 = 6
print("Before -> Player 1's value: \(player1), Player 2's value: \(player2)")
swapValues(&player1, &player2)
print("After -> Player 1's value: \(player1), Player 2's value: \(player2)")

// ---------------Function Types as Parameter Types---------------
// (Int, Int) -> Int
func addInts(_ a: Int, _ b: Int) -> Int {
  return a + b
}

// (Int, Int) -> Int
func multiplyInts(_ a: Int, _ b: Int) -> Int {
  return a * b
}

func printResults(for mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
  print("Result: \(mathFunction(a, b))")
}

printResults(for: multiplyInts, 4, 3)
printResults(for: addInts, 4, 3)

// ---------------Nested Functions---------------
func chooseArrayFunction(add: Bool) -> ([Int], Int) -> [Int] {
    func addToArray(input: [Int], valueToAdd: Int) -> [Int] {
        var newArray = input
        newArray.append(valueToAdd)
        return newArray
    }
    
    func removeFromArray(input: [Int], index: Int) -> [Int] {
        var newArray = input
        newArray.remove(at: index)
        return newArray
    }
    
    return add ? addToArray : removeFromArray
}

var array: [Int] = [3, 23, 24, 12, 8]
print("current array: \(array)")
var modifyArray = chooseArrayFunction(add: true)
var newArray = modifyArray(array, 18)
print("modified array (add): \(newArray)")
modifyArray = chooseArrayFunction(add: false)
newArray = modifyArray(array, array.count - 1)
print("modified array (remove): \(newArray)")

