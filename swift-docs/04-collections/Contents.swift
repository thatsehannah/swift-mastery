import Cocoa


// -----------------------ARRAYS-----------------------
var list = ["LeBron", "Jordan", "Kobe", "Wade"]

// Appending
list.append("Iverson")

// Inserting at index
list.insert("Shaq", at: 3)

// Removing at index
list.remove(at: 3)

// Using enumerated method
//for (index, item) in list.enumerated() {
//    print("\(index + 1). \(item)")
//}

// -----------------------SETS-----------------------
var teamA: Set = [23, 77, 15, 3, 0]
var teamB: Set = [24, 8, 34, 32, 3]

var intersection = teamA.intersection(teamB).sorted()
print(intersection)

var symmetry = teamA.symmetricDifference(teamB).sorted()
print(symmetry)

var union = teamA.union(teamB).sorted()
print(union)

var difference = teamA.subtracting(teamB).sorted()
print(difference)

let setA: Set = [4, 5]
let setB: Set = [1, 2, 3, 4, 5]
let setC: Set = [6, 7]

var subset = setA.isSubset(of: setB)
print(subset)

var superset = setB.isSuperset(of: setA)
print(superset)

var disjoint = setC.isDisjoint(with: setA)
print(disjoint)

var disjoint2 = setB.isDisjoint(with: setA)
print(disjoint2)
