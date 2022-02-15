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


