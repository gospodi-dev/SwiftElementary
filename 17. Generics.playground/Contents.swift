/*: # Глава 17. Generics (Дженерики) */
/*: ## Part 01. Introducing generics (Внедрение дженериков) */

//enum PetKind {
//    case cat
//    case dog
////  case bird
//}
//
//struct KeeperKind {
//    var keeperOf: PetKind
//}
//
//let catKeeper = KeeperKind(keeperOf: .cat)
//let dogKeeper = KeeperKind(keeperOf: .dog)

// types driving types

/* try 1: manually mirrored types
class Cat {}
class Dog {}

class KeeperForCats {}
class KeeperForDogs {}
*/

/* try 2: generics to establish type relationship
class Cat {}
class Dog {}

class Keeper<Animal> {}

var aCatKeeper = Keeper<Cat>()
//var aKeeper = Keeper()  // compile-time error!
*/

/*: ## Part 02. Anatomy of generic types (Анатомия дженерик типов) */

//class Keeper<Animal> {}
//
//// var aCatKeeper = Keeper<Cat>()

//class Cat {
//  var name: String
//
//  init(name: String) {
//    self.name = name
//  }
//}
//
//class Dog {
//  var name: String
//
//  init(name: String) {
//    self.name = name
//  }
//}
//
//class Keeper<Animal> {
//  var name: String
//  var morningCare: Animal
//  var afternoonCare: Animal
//
//  init(name: String, morningCare: Animal, afternoonCare: Animal) {
//    self.name = name
//    self.morningCare = morningCare
//    self.afternoonCare = afternoonCare
//  }
//}
//
//let jason = Keeper(name: "Jason",
//                   morningCare: Cat(name: "Whiskers"),
//                   afternoonCare: Cat(name: "Sleepy"))

/*: ### Mini-exercises (Мини-упражнения) */

// предположим, что Салли - это имя человека, который присматривает за собаками, за собакой по имени "Бенджи" утром и собакой по имени "Руфус" днем.
// let sally = Keeper(name: "Sally", morningCare: Dog(name: "Benji"), afternoonCare: Dog(name: "Rufus"))

// Это приложение не управляет ядерным реактором. Лучший способ узнать это - попробовать! Откомментируем следующую строку

// let paul = Keeper(name: "Paul", morningCare: Dog(name: "Lucky"), afternoonCare: Cat(name: "Sleepy"))
/*
Ошибка, которую мы получаем, выглядит следующим образом: Противоречивые аргументы для общего параметра 'Animal' ('Dog' vs 'Cat').

Это именно то, чего мы ожидали. Swift требует, чтобы общий параметр `Animal` принимал один тип, поэтому возникает конфликт, если параметр `morningCare` и параметр `afternoonCare` ожидают разные типы.
*/
// Это работает. Как вы узнаете в следующем разделе, ограничения типов помогут вам избежать этой проблемы.

// let stringKeeper = Keeper(name: "StringKeeper", morningCare: "", afternoonCare: "")

/*: ## Part 03. Type constraints (Ограничения типа) */

class Cat {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

class Dog {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

protocol Pet {
  var name: String { get }  // all pets respond to a name
}
extension Cat: Pet {}
extension Dog: Pet {}

class Keeper<Animal: Pet> {
  var name: String
  var morningCare: Animal
  var afternoonCare: Animal
  
  init(name: String, morningCare: Animal, afternoonCare: Animal) {
    self.name = name
    self.morningCare = morningCare
    self.afternoonCare = afternoonCare
  }
}

let jason = Keeper(name: "Jason", morningCare: Cat(name: "Whiskers"), afternoonCare: Cat(name: "Sleepy"))


extension Array where Element: Cat {
  func meow() {
    forEach { print("\($0.name) says meow!") }
  }
}

protocol Meowable {
  func meow()
}

extension Cat: Meowable {
  func meow() {
    print("\(self.name) says meow!")
  }
}

extension Array: Meowable where Element: Meowable {
  func meow() {
    forEach { $0.meow() }
  }
}

/*: ## Part 04. Arrays (Массивы), Dictionaries (Словари), Optionals */

//let animalAges: [Int] = [2,5,7,9]

let animalAges: Array<Int> = [2,5,7,9]
//: Dictionaries
let intNames: Dictionary<Int, String> = [42: "forty-two"]
let intNames2: [Int: String] = [42: "forty-two", 7: "seven"]
let intNames3 = [42: "forty-two", 7: "seven"]
//: Optionals
enum OptionalDate {
  case none
  case some(Date)
}

enum OptionalString {
  case none
  case some(String)
}

struct FormResults {
  // other properties here
  var birthday: OptionalDate
  var lastName: OptionalString
}

// Keep this commented out so we can keep using Swift's Optional type, not our own.
//enum Optional<Wrapped> {
//  case none
//  case some(Wrapped)
//}

var birthdate: Optional<Date> = .none
if birthdate == .none {
  // no birthdate
}

var birthdate2: Date? = nil
if birthdate2 == nil {
  // no birthdate
}

func swapped<T, U>(_ x: T, _ y: U) -> (U, T) {
  (y, x)
}

swapped(33, "Jay")  // returns ("Jay", 33)


/*: ## Challenge 1: Build a collection */

class Cat {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

class Dog {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

// solution:

class Keeper<Animal> {
  
  var name: String
  
  // этот частный массив отслеживает животных, за которыми ухаживает этот сторож
  // Примечание: он использует тот же тип Animal, что и параметр типа, используемый для определения хранителя
  private var animals: [Animal] = []
  
  init(name: String) {
    self.name = name
  }
  
  // adds a new animal to the keeper's list of animals
  func lookAfter(_ animal: Animal) -> Void {
    animals.append(animal)
  }
  
  // count the animals under the keeper's care
  var count: Int {
    animals.count
  }
  
  // removes the last animal from the keeper's list of animals
  // It is an error to try to remove the last animal when there are no animals
  func removeLast() -> Animal {
    animals.removeLast()
  }
  
  // returns the animal at `index`
  func animal(at index: Int) -> Animal {
    animals[index]
  }
}

/*
 Дополнительный комментарий:
 
 Как видно, приведенное выше решение не требует ничего большего, чем просто обернуть базовый примитив массива, раскрыв несколько его методов и свойств.
 
 Если бы вы хотели, чтобы ваш хранитель мог обращаться к животным по имени, вы могли бы искать в массиве по имени животного или использовать словарь вместо массива, отображая имена животных на их значения.
 */
