/*: # Глава 16. Protocols (Протоколы) */
/*: ## Part 01. Protocol syntax (Синтаксис протокола) */

protocol Vehicle {
    func accelerate()
    func stop()
}

// let vehicle = Vehicle() // error: 'Vehicle' cannot be constructed because it has no accessible initializers (ошибка: 'Vehicle' не может быть построен, потому что у него нет доступных инициализаторов)

class Unicycle: Vehicle {
    var peddling = false
    
    func accelerate() {
        peddling = true
    }
    
    func stop() {
        peddling = false
    }
}

/*: ## Part 02. Methods in protocols (Методы в протоколах) */

enum Direction {
  case left
  case right
}

protocol DirectionalVehicle {
  func accelerate()
  func stop()
  func turn(_ direction: Direction)
  func description() -> String
}

//protocol OptionalDirectionVehicle {
//  // Build error!
//  func turn(_ direction: Direction = .left)
//}
//// error: default argument not permitted in a protocol method (ошибка: аргумент по умолчанию не разрешен в методе протокола)
protocol OptionalDirectionVehicle {
  func turn()
  func turn(_ direction: Direction)
}

/*: ## Part 03. Properties in protocols (Свойства в протоколах) */

protocol VehicleProperties {
    var weight: Int {get}
    var name: String {get set}
}

/*: ## Part 04. Initializers in protocols (Инициализаторы в протоколах) */
protocol Account {
    var value: Double {
        get set
    }
    init(initialAmount: Double)
    init?(transferAccount: Account)
}

class BitcoinAccount: Account {
  var value: Double
  required init(initialAmount: Double) {
    value = initialAmount
  }
  required init?(transferAccount: Account) {
    guard transferAccount.value > 0.0 else {
      return nil
    }
    value = transferAccount.value
  }
}

var accountType: Account.Type = BitcoinAccount.self
let account = accountType.init(initialAmount: 30.00)
let transferAccount = accountType.init(transferAccount: account)!

/*: ## Part 05. Protocol inheritance (Наследование протокола) */
protocol WheeledVehicle: Vehicle {
  var numberOfWheels: Int { get }
  var wheelSize: Double { get set }
}
