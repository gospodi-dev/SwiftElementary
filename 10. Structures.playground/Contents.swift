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


/*: ### Part 06. Conforming to a protocol (Соответствие протоколу) */
public protocol CustomStringConvertible {
  /// A textual representation of this instance. (Текстовое представление данного экземпляра.)
  var description: String { get }
}

struct DeliveryArea: CustomStringConvertible {
  let center: Location
  var radius: Double
  var description: String {
    """
    Area with center: (x: \(center.x), y: \(center.y)),
    radius: \(radius)
    """
  }

  func contains(_ location: Location) -> Bool {
    distance(from: center, to: location) < radius
  }

  func overlaps(with area: DeliveryArea) -> Bool {
    distance(from: center, to: area.center) <=
    (radius + area.radius)
  }
}

print(area1) // Area with center: (x: 3, y: 3), radius: 4.0
print(area2) // Area with center: (x: 3, y: 3), radius: 2.5
*/

/*: ## Challenges. Structures */
//: Challenge 1: Fruit tree farm (Ферма фруктовых деревьев)
// All kinds of fruit will share these attributes. Все виды фруктов обладают следующими признаками
struct Fruit {
    let kind: String // вид - e.g. Apple, Pear, Orange
    let weight: Int // measured in grams (измеряется в граммах)
}

// Load up the truck full of fruits with random weights (Загрузите грузовик фруктами с произвольным весом)
let truck: [Fruit] = [
    Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
    Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
    Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
    Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
    Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
    Fruit(kind: "Apple", weight: Int.random(in: 70...100))
]

// Allocate the inventory containers (Распределите контейнеры для инвентаря)
var pears = [Fruit]()
var apples = [Fruit]()
var oranges = [Fruit]()

var totalProcessedWeight = 0

// The sorting algorithm accepts a truck full of fruits.
// It processes each fruit independently to
// check what kind of fruit it is and
// place each one into the correct inventory container

// Алгоритм сортировки принимает грузовик, полный фруктов.
// Он обрабатывает каждый фрукт независимо, чтобы
// проверить, что это за фрукт, и
// помещает каждый из них в нужный контейнер

func receive(_ truck: [Fruit]) {
  for fruit in truck {
    switch fruit.kind {
    case "Pear":
      pears.append(fruit)
    case "Apple":
      apples.append(fruit)
    case "Orange":
      oranges.append(fruit)
    default:
      fatalError("Fruit type not supported")
    }
    
    totalProcessedWeight += fruit.weight
  }
}

receive(truck)

print("Общий вес:", totalProcessedWeight, "grams", "\n---")
print("Количество груш:\t\t", pears.count)
print("Количество яблок:\t\t", apples.count)
print("Количество апельсинов:\t", oranges.count, "\n")

/*
Общий вес: 476 grams
---
Количество груш:           2
Количество яблок:          3
Количество апельсинов:     1
*/

//: Challenge 2: A T-shirt model (Модель футболки)
typealias Size = String
let small: Size = "Small"
let medium: Size = "Medium"
let large: Size = "Large"
let xLarge: Size = "XLarge"

typealias Material = String
let cotton: Material = "Cotton"
let polyester: Material = "Polyester"
let wool: Material = "Wool"

typealias Color = String

/*:
 - Использование чисел с плавающей точкой хорошо для демонстраций, но есть тонкие, но важные причины, по которым вы не должны использовать Floats или Doubles для валюты в производстве. О причинах читайте в этом ответе на [Stack Overflow](http://stackoverflow.com/questions/3730019/why-not-use-double-or-float-to-represent-currency).
 */

struct TShirt {
  let size: Size
  let color: Color
  let material: Material

  func cost() -> Double {

    let basePrice = 10.0

    let sizeMultiplier: Double
    switch size {
    case small, medium:
      sizeMultiplier = 1.0
    case large, xLarge:
      sizeMultiplier = 1.1
    default:
      // Special order!
      sizeMultiplier = 1.2
    }

    let materialMultipler: Double
    switch material {
    case cotton:
      materialMultipler = 1.0
    case polyester:
      materialMultipler = 1.1
    case wool:
      materialMultipler = 1.5
    default:
      // Special order!
      materialMultipler = 2.0
    }

    return basePrice * sizeMultiplier * materialMultipler
  }
}

TShirt(size: medium, color: "Green", material: cotton).cost() // $10.00
TShirt(size: xLarge, color: "Gray", material: wool).cost() // $16.50
