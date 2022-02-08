/*: # Глава 13. Classes (Классы) */
/*: ## Part 01. Creating classes (Создание классов) */

class Person {
  var firstName: String
  var lastName: String

  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }

  var fullName: String {
    "\(firstName) \(lastName)"
  }
}

let john = Person(firstName: "Johnny", lastName: "Appleseed")

/*: ## Part 02. Reference types (Ссылочные типы) */

//class SimplePerson {
//  let name: String
//  init(name: String) {
//    self.name = name
//  }
//}
struct SimplePerson {
    let name: String
}

var var1 = SimplePerson(name: "John")
var var2 = var1

//: Working with references (Работа со ссылками)

struct Location {
  let x: Int
  let y: Int
}

struct DeliveryArea {
  var range: Double
  let center: Location
}

var area1 = DeliveryArea(range: 2.5,
                         center: Location(x: 2, y: 4))
var area2 = area1
print(area1.range) // 2.5
print(area2.range) // 2.5

area1.range = 4
print(area1.range) // 4.0
print(area2.range) // 2.5

var homeOwner = john
john.firstName = "John" // John wants to use his short name!
john.firstName // "John"
homeOwner.firstName // "John"
