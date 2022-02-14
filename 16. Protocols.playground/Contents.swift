/*: # Глава 16. Protocols (Протоколы) */
/*: ## Part 01. Protocol syntax (Синтаксис протокола) */
/*
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

/*: ### Mini-exercises (Мини-упражнения) */
//: 1 - Create a protocol Area that defines a read-only property area of type Double.
protocol Area {
    var area: Double {
        get
    }
}

//: 2. Implement Area with structs representing Square, Triangle, and Circle.

struct Square: Area {
  let side: Double
  
  var area: Double {
    side * side
  }
}

struct Triangle: Area {
  let base: Double
  let height: Double
  
  var area: Double  {
    0.5 * base * height
  }
}

struct Circle: Area {
  let radius: Double
  
  var area: Double  {
    .pi * radius * radius
  }
}


//: 3. Add a circle, square, and triangle to an array. Convert the array of shapes to an array of areas using map.
let square = Square(side: 4)
let triangle = Triangle(base: 3, height: 5)
let circle = Circle(radius: 2)
let shapes: [Area] = [square, triangle, circle]
print(shapes.map { $0.area })
// [16.0, 7.5, 12.566370614359172]


/*: ## Part 06. Implementing protocols (Реализация протоколов) */
class Bike: Vehicle {
  var peddling = false
  var brakesApplied = false

  func accelerate() {
    peddling = true
    brakesApplied = false
  }

  func stop() {
    peddling = false
    brakesApplied = true
  }
}

/*: ## Part 07. Implementing properties (Реализация свойств) */
class Bike: WheeledVehicle {

  let numberOfWheels = 2
  var wheelSize = 16.0

  var peddling = false
  var brakesApplied = false

  func accelerate() {
    peddling = true
    brakesApplied = false
  }

  func stop() {
    peddling = false
    brakesApplied = true
  }
}

/*: ## Part 08. Associated types in protocols (Ассоциированные типы в протоколах) */
protocol WeightCalculatable {
  associatedtype WeightType
  var weight: WeightType { get }
}

class HeavyThing: WeightCalculatable {
  // This heavy thing only needs integer accuracy
  typealias WeightType = Int

  var weight: Int { 100 }
}

class LightThing: WeightCalculatable {
  // This light thing needs decimal places
  typealias WeightType = Double

  var weight: Double { 0.0025 }
}

// Build error!
// protocol 'WeightCalculatable' can only be used as a generic
// constraint because it has Self or associated type requirements.
// Ошибка построения!
// Протокол 'WeightCalculatable' может быть использован только как общее ограничение, потому что он не может быть использован как общий тип ограничение, потому что у него есть Self или связанные требования к типу.
// let weightedThing: WeightCalculatable = LightThing()

/*: ## Part 09. Implementing multiple protocols (Реализация нескольких протоколов) */

protocol Wheeled {
  var numberOfWheels: Int { get }
  var wheelSize: Double { get set }
}

class Bike: Vehicle, Wheeled {
  // Implement both Vehicle and Wheeled
}

//: Protocol composition (Состав протокола)
func roundAndRound(transportation: Vehicle & Wheeled) {
    transportation.stop()
    print("The brakes are being applied to
          \(transportation.numberOfWheels) wheels.")
}

roundAndRound(transportation: Bike())
// The brakes are being applied to 2 wheels.
*/
/*: ## Part 10. Extensions & protocol conformance (Расширения и соответствие протоколам) */
protocol Reflective {
    var typeName: String {
        get
    }
}

extension String: Reflective {
    var typeName: String {
        "I'm a String"
    }
}

let title = "Swift Apprentice!"
title.typeName // "I'm a String"

class AnotherBike: Wheeled {
  var peddling = false
  let numberOfWheels = 2
  var wheelSize = 16.0
}

extension AnotherBike: Vehicle {
  func accelerate() {
    peddling = true
  }
  
  func stop() {
    peddling = false
  }
}
