import Cocoa

// String delimiters
var greeting = #"""
    Here are three more double quotes: """
    """#
print(greeting)

var line = #"Line 1\nLine 2"#
print(line)

// Counting Characters
var text = "abcdefghijklmnop"
print("The text has \(text.count) characters")

// Indexing
let string = "Hello"
print(string[string.startIndex])

let index1 = string[string.index(before: string.endIndex)]
let index2 = string[string.index(after: string.startIndex)]

print(index1)
print(index2)

// Substrings
let greeting2 = "Hello, World!"
let index = greeting2.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting2[..<index]
print(beginning)
