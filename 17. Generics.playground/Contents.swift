/*: # Глава 17. Generics (Дженерики) */
/*: ## Part 01. Introducing generics (Внедрение дженериков) */

enum PetKind {
    case cat
    case dog
//  case bird
}

struct KeeperKind {
    var keeperOf: PetKind
}

let catKeeper = KeeperKind(keeperOf: .cat)
let dogKeeper = KeeperKind(keeperOf: .dog)

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

class Keeper<Animal> {
  var name: String
  var morningCare: Animal
  var afternoonCare: Animal

  init(name: String, morningCare: Animal, afternoonCare: Animal) {
    self.name = name
    self.morningCare = morningCare
    self.afternoonCare = afternoonCare
  }
}

let jason = Keeper(name: "Jason",
                   morningCare: Cat(name: "Whiskers"),
                   afternoonCare: Cat(name: "Sleepy"))

/*: ### Mini-exercises (Мини-упражнения) */

// предположим, что Салли - это имя человека, который присматривает за собаками, за собакой по имени "Бенджи" утром и собакой по имени "Руфус" днем.
let sally = Keeper(name: "Sally", morningCare: Dog(name: "Benji"), afternoonCare: Dog(name: "Rufus"))

// Это приложение не управляет ядерным реактором. Лучший способ узнать это - попробовать! Откомментируем следующую строку

// let paul = Keeper(name: "Paul", morningCare: Dog(name: "Lucky"), afternoonCare: Cat(name: "Sleepy"))
/*
Ошибка, которую мы получаем, выглядит следующим образом: Противоречивые аргументы для общего параметра 'Animal' ('Dog' vs 'Cat').

Это именно то, чего мы ожидали. Swift требует, чтобы общий параметр `Animal` принимал один тип, поэтому возникает конфликт, если параметр `morningCare` и параметр `afternoonCare` ожидают разные типы.
*/
// Это работает. Как вы узнаете в следующем разделе, ограничения типов помогут вам избежать этой проблемы.

let stringKeeper = Keeper(name: "StringKeeper", morningCare: "", afternoonCare: "")
