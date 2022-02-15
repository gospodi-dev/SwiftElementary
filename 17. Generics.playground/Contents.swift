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

enum EnumKeeperKind {
  case catKeeper
  case dogKeeper
}


/*: ## Part 02. Anatomy of generic types (Анатомия дженерик типов) */

class Keeper<Animal> {}

// var aCatKeeper = Keeper<Cat>()

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
