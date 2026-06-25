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
for (index, item) in list.enumerated() {
    print("\(index + 1). \(item)")
}
