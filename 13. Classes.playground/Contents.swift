/*: # Глава 13. Classes (Классы) */
/*: ## Part 01. Creating classes (Создание классов) */
/*
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

/*: ### Classes. Mini-exercise 1*/

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
var homeOwner = john

homeOwner.lastName = "Googleseed"

print(john.fullName) // Johnny Googleseed
print(homeOwner.fullName) // Johnny Googleseed

/*: ## Part 03. Object identity (Идентичность объектов) */

john === homeOwner // true

let imposterJohn = Person(firstName: "Johnny",
                          lastName: "Appleseed")

john === homeOwner // true
john === imposterJohn // false
imposterJohn === homeOwner // false

// Assignment of existing variables changes the instances the variables reference (Присвоение существующих переменных изменяет экземпляры, на которые ссылаются переменные).
homeOwner = imposterJohn  // Person
john === homeOwner // false

homeOwner = john // Person
john === homeOwner // true


// Check to ensure the real John is not found among the imposters (Проверьте, не находится ли настоящий Джон среди самозванцев).
imposters.contains {
  $0 === john
} // false

// Now hide the "real" John somewhere among the imposters (Теперь спрячьте "настоящего" Джона где-нибудь среди самозванцев.).
imposters.insert(john, at: Int.random(in: 0..<100))

// John can now be found among the imposters (Теперь Джона можно найти среди самозванцев.).
imposters.contains {
  $0 === john
} // true

// Since `Person` is a reference type, you can use === to grab the real John out of the list of imposters and modify the value (Поскольку `Person` является ссылочным типом, вы можете использовать ===, чтобы взять настоящего Джона из списка самозванцев и изменить значение).
// The original `john` variable will print the new last name! (В исходной переменной `john` будет выведена новая фамилия)
if let indexOfJohn = imposters.firstIndex(where:
                                          { $0 === john }) {
  imposters[indexOfJohn].lastName = "Bananapeel"
}

john.fullName // John Bananapeel
 */

/*: ### Classes. Mini-exercise 2*/

func memberOf(person: Person, group: [Person]) -> Bool {
  group.contains(where: { $0 === person })
}

let johnny = Person(firstName: "Johnny", lastName: "Appleseed")
let jane = Person(firstName: "Jane", lastName: "Appleseed")
let anonymous1 = Person(firstName: "Bob", lastName: "Anonymous")
let anonymous2 = Person(firstName: "Bill", lastName: "Anonymous")
let anonymous3 = Person(firstName: "Biff", lastName: "Anonymous")

let group1 = [johnny, jane, anonymous1, anonymous2, anonymous3]
let group2 = [johnny, john, anonymous1, anonymous2, anonymous3]

memberOf(person: john, group: group1)
memberOf(person: john, group: group2)
