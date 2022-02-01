/*: ## 10. Structures (Структуры) */
/*: ### Part 01. Introducing structures (Представление структур) */
let restaurantLocation = (3, 3)
let restaurantRange = 2.5

/*
// Pythagorean Theorem 📐🎓
func distance(from source: (x: Int, y: Int),
              to target: (x: Int, y: Int)) -> Double {
  let distanceX = Double(source.x - target.x)
  let distanceY = Double(source.y - target.y)
  return (distanceX * distanceX +
    distanceY * distanceY).squareRoot()
}
func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
  let deliveryDistance = distance(from: location,
                                  to: restaurantLocation) // 2.82842712474619
  return deliveryDistance < restaurantRange
}

isInDeliveryRange(location: (x: 5, y: 5)) // false
*/

let otherRestaurantLocation = (8, 8)
let otherRestaurantRange = 2.5

// Pythagorean Theorem 📐🎓
func distance(from source: (x: Int, y: Int),
              to target: (x: Int, y: Int)) -> Double {
  let distanceX = Double(source.x - target.x)
  let distanceY = Double(source.y - target.y)
  return (distanceX * distanceX +
    distanceY * distanceY).squareRoot()
}

func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
  let deliveryDistance =
    distance(from: location, to: restaurantLocation)
  
  let secondDeliveryDistance =
    distance(from: location, to: otherRestaurantLocation) // 4.242640687119285
  
  return deliveryDistance < restaurantRange ||
    secondDeliveryDistance < otherRestaurantRange
}

isInDeliveryRange(location: (x: 5, y: 5)) // false

/*: ### Part 02. Your first structure (Ваша первая структура) */
//: переведите местоположение из кортежей в тип структуры
struct Location {
    let x: Int
    let y: Int
}

let storeLocation = Location(x: 3, y: 3)

struct DeliveryArea {
  let center: Location
  var radius: Double
    
  func contains(_ location: Location) -> Bool {
      let distanceFromCenter =
        distance(from: (center.x, center.y),
                   to: (location.x, location.y))

      return distanceFromCenter < radius
    }
}

var storeArea = DeliveryArea(center: storeLocation, radius: 2.5)

/*
/*: ### Mini-exercise 1. (Ordering Pizza) */
struct Pizza {
    let size: Int //
    let toppings: [String]
    let style: String
}

let pizza = Pizza(size: 24, toppings: ["Pepperoni", "Mushrooms", "Anchovies"], style: "Derevenskay")
*/

/*: ### Part 03. Accessing members (Доступ к членам структуры) */
//: доступа к членам используется точечный синтаксис (dot syntax)
storeArea.radius // 2.5
storeArea.center.x // 3
storeArea.radius = 3.5

//let fixedArea = DeliveryArea(center: storeLocation, radius: 4) // Error: Cannot assign to property (Невозможно присвоить свойству)
//fixedArea.radius = 3.5

/*: ### Mini-exercise 2. (Refactoring isInDeliveryRange) */

/*: ### Part 04. Introducing methods (Внедрение методов) */
let areas = [
  DeliveryArea(center: Location(x: 3, y: 3), radius: 2.5),
  DeliveryArea(center: Location(x: 8, y: 8), radius: 2.5)
]

func isInDeliveryRange(_ location: Location) -> Bool {
  for area in areas {
    let distanceToStore =
      distance(from: (area.center.x, area.center.y),
                 to: (location.x, location.y))

    if distanceToStore < area.radius {
      return true
    }
  }
  return false
}

let customerLocation1 = Location(x: 5, y: 5)
let customerLocation2 = Location(x: 7, y: 7)

isInDeliveryRange(customerLocation1) // false
isInDeliveryRange(customerLocation2) // true

let area = DeliveryArea(center: Location(x: 8, y: 8), radius: 2.5)
let customerLocation = Location(x: 7, y: 7)
area.contains(customerLocation) // true

/*: ### Mini-exercise 3. (Refactoring DeliveryArea) */
//: 1

struct Location {
  let x: Int
  let y: Int
}

func distance(from source: Location, to target: Location) -> Double {
  let distanceX = Double(source.x - target.x)
  let distanceY = Double(source.y - target.y)
  return sqrt(distanceX * distanceX + distanceY * distanceY)
}

//: 2, 3
struct DeliveryArea {
  let center: Location
  var radius: Double
  
  func contains(_ location: Location) -> Bool {
    distance(from: center, to: location) < radius
  }
  
  func overlaps(with area: DeliveryArea) -> Bool {
    distance(from: center, to: area.center) <= (radius + area.radius)
  }
}

let area1 = DeliveryArea(center: Location(x: 3, y: 3), radius: 2.5)
let area2 = DeliveryArea(center: Location(x: 8, y: 8), radius: 2.5)
area1.overlaps(with: area2) // false

let area3 = DeliveryArea(center: Location(x: 4, y: 4), radius: 2.5)
let area4 = DeliveryArea(center: Location(x: 7, y: 7), radius: 2.5)
area3.overlaps(with: area4) // true


/*: ### Part 05. Structures as values (Структуры как значения) */
var a = 5
var b = a

a // 5
b // 5

a = 10

a // 10
b // 5

var area1 = DeliveryArea(center: Location(x: 3, y: 3), radius: 2.5)
var area2 = area1

area1.radius // 2.5
area2.radius // 2.5

area1.radius = 4

area1.radius // 4.0
area2.radius // 2.5
