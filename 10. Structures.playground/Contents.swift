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


