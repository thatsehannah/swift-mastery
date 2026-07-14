import Cocoa

// --------------Creating an enum--------------
enum CompassPoint {
    case north, south, east, west
}

var directionToHead = CompassPoint.east
directionToHead = .south

// --------------Iterating over an enum--------------
enum Beverage: CaseIterable {
    case coffee, tea, juice
}

for beverage in Beverage.allCases {
    print(beverage)
}

print("--------------")

// --------------Associated Values--------------
enum Barcode {
  case upc(Int, Int, Int, Int)
  case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)

switch productBarcode {
  case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
  case let .qrCode(productCode):
    print("QR Code: \(productCode)")
}

// --------------Raw Values--------------
enum Planet: Int {
    case mercury, venus, earth = 5, mars, jupiter, saturn, uranus, neptune
}

print(Planet.earth.rawValue)
print(Planet.venus.rawValue)
print(Planet.mars.rawValue)

let planet = Planet(rawValue: 5)

