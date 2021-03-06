/*: # Глава 15. Enumerations (Перечисления) */
/*: ## Part 01. Declaring an enumeration (Объявление перечисления) */

//let months = ["January", "February", "March", "April", "May",
//              "June", "July", "August", "September", "October",
//              "November", "December"]

//func semester(for month: String) -> String {
//  switch month {
//  case "August", "September", "October", "November", "December":
//    return "Autumn"
//  case "January", "February", "March", "April", "May":
//    return "Spring"
//  default:
//    return "Not in the school year"
//  }
//}

//semester(for: "April")
// Spring

//enum Month {
//  case january
//  case february
//  case march
//  case april
//  case may
//  case june
//  case july
//  case august
//  case september
//  case october
//  case november
//  case december
//}

// or
/*
enum Month {
  case january, february, march, april, may, june, july, august,
  september, october, november, december
}

/*: ## Part 02. Deciphering an enumeration in a function (Расшифровка перечисления в функции) */

//func semester(for month: Month) -> String {
//  switch month {
//  case Month.august, Month.september, Month.october,
//       Month.november, Month.december:
//    return "Autumn"
//  case Month.january, Month.february, Month.march, Month.april,
//       Month.may:
//    return "Spring"
//  default:
//    return "Not in the school year"
//  }
//}

// OR

//func semester(for month: Month) -> String {
//  switch month {
//  case .august, .september, .october, .november, .december:
//    return "Autumn"
//  case .january, .february, .march, .april, .may:
//    return "Spring"
//  default:
//    return "Not in the school year"
//  }
//}

// OR
func semester(for month: Month) -> String {
  switch month {
  case .august, .september, .october, .november, .december:
    return "Autumn"
  case .january, .february, .march, .april, .may:
    return "Spring"
  case .june, .july:
    return "Summer"
  }
}

var month = Month.april
semester(for: month)
// "Spring"

month = .september
semester(for: month)
// "Autumn"

/*: ### Enumerations Mini-exercise, Semester Computed Property */
enum Month {
  case january, february, march, april, may, june, july, august, september, october, november, december
  
  var semester: String {
    switch self {
    case .august, .september, .october, .november, .december:
      return "Autumn"
    case .january, .february, .march, .april, .may:
      return "Spring"
    case .june, .july:
      return "Summer"
    }
  }
}

var month = Month.september
let semester = month.semester // "Autumn"

/*: ## Part 03. Raw values (Необработанные значения) */

//enum Month: Int {
//  case january = 1, february = 2, march = 3, april = 4, may = 5,
//  june = 6, july = 7, august = 8, september = 9,
//  october = 10, november = 11, december = 12
//}

// OR

enum Month: Int {
  case january = 1, february, march, april, may, june, july,
  august, september, october, november, december
}

//: Accessing the raw value (Доступ к необработанному значению)

func monthsUntilWinterBreak(from month: Month) -> Int {
  Month.december.rawValue - month.rawValue
}
monthsUntilWinterBreak(from: .april) // 8

//: Initializing with the raw value (Инициализация с помощью необработанного значения)

let fifthMonth = Month(rawValue: 5)! // may
monthsUntilWinterBreak(from: fifthMonth) // 7

/*: ### Enumerations Mini-exercise, Months Until Winter Break Computed Property */

enum Month: Int {
  case january = 1, february, march, april, may, june, july, august, september, october, november, december
  
  var monthsUntilWinterBreak: Int {
    Month.december.rawValue - rawValue
  }
}

let fifthMonth = Month(rawValue: 5)!
let monthsLeft = fifthMonth.monthsUntilWinterBreak // 7

/*: ## Part 04. String raw values (Строковые необработанные значения) */

// 1
enum Icon: String {
  case music
  case sports
  case weather

  var filename: String {
    // 2
    "\(rawValue).png"
  }
}
let icon = Icon.weather
icon.filename // weather.png

//: Unordered raw values (Неупорядоченные необработанные значения)
//
//enum Coin: Int {
//  case penny = 1
//  case nickel = 5
//  case dime = 10
//  case quarter = 25
//}
//
//let coin = Coin.quarter
//coin.rawValue // 25

/*: ### Enumerations Mini-exercise, Coin Purse */

enum Coin: Int {
  case penny = 1
  case nickel = 5
  case dime = 10
  case quarter = 25
}
let coinPurse: [Coin] = [.penny, .quarter, .nickel, .dime, .penny, .dime, .quarter]

/*: ## Part 05. Associated values (Ассоциированные значения) */

var balance = 100

//func withdraw(amount: Int) {
//  balance -= amount
//}

enum WithdrawalResult {
  case success(newBalance: Int)
  case error(message: String)
}

func withdraw(amount: Int) -> WithdrawalResult {
  if amount <= balance {
    balance -= amount
    return .success(newBalance: balance)
  } else {
    return .error(message: "Not enough money!")
  }
}

let result = withdraw(amount: 99)

switch result {
case .success(let newBalance):
  print("Your new balance is: \(newBalance)")
case .error(let message):
  print(message)
}
// Your new balance is: 1


enum HTTPMethod {
  case get
  case post(body: String)
}

let request = HTTPMethod.post(body: "Hi there")
guard case .post(let body) = request else {
  fatalError("No message was posted")
}
print(body)
// Hi there

//: Enumeration as a state machine (Перечисление как машина состояний)

enum TrafficLight {
  case red, yellow, green
}
let trafficLight = TrafficLight.red

/*: ### Enumerations Mini-exercise, Light Switch */

enum Light {
    case on
    case off
}

var light = Light.off
light = .on

/*: ## Part 06. Iterating through all cases (Итерация по всем случаям) */
enum Pet: CaseIterable {
  case cat, dog, bird, turtle, fish, hamster
}

for pet in Pet.allCases {
  print(pet)
}
//cat
//dog
//bird
//turtle
//fish
//hamster

/*: ## Part 07. Enumerations without any cases (Перечисления без случаев) */

//struct Math {
//  static func factorial(of number: Int) -> Int {
//    (1...number).reduce(1, *)
//  }
//}
//let factorial = Math.factorial(of: 6) // 720



enum Math {
  static func factorial(of number: Int) -> Int {
    (1...number).reduce(1, *)
  }
}
let factorial = Math.factorial(of: 6) // 720

//let math = Math() // error: 'Math' cannot be constructed because it has no accessible initializers
 */
/*: ### Enumerations Mini-exercise, e Math Namespace*/
import Foundation

enum Math {
  static let e = 2.7183
  
  static func factorial(of number: Int) -> Int {
    (1...number).reduce(1, *)
  }
}

let nestEgg = 25000 * pow(Math.e, 0.07 * 20)
// $101,380.95

/*: ## Part 08. Optionals */
var age: Int?
age = 17
age = nil

switch age {
case .none:
  print("No value")
case .some(let value):
  print("Got a value: \(value)")
}
// No value

let optionalNil: Int? = .none
optionalNil == nil    // true
optionalNil == .none  // true

/*: ## Challenge 1: Adding raw values (Добавление необработанных значений) */
enum Coin: Int {
  case penny = 1
  case nickel = 5
  case dime = 10
  case quarter = 25
}

let coinPurse: [Coin] = [.penny, .quarter, .nickel, .dime, .penny, .dime, .quarter]

func value(for purse: [Coin]) -> Int {
  var balance = 0
  for coin in purse {
    balance += coin.rawValue
  }
  return balance
}

value(for: coinPurse) // 77 cents

// An advanced way to do the same thing would be to use higher order function `reduce(_:combine:)`: (Продвинутый способ сделать то же самое - использовать функцию высшего порядка)

let quickPurseValue = coinPurse.reduce(0) { $0 + $1.rawValue }
quickPurseValue // 77 cents

/*: ## Challenge 2: Computing with raw values (Вычисления с необработанными значениями) */
enum Month: Int {
  case january = 1, february, march, april, may, june, july, august, september, october, november, december
  
  var monthsUntilSummer: Int {
    var monthsLeft = Month.june.rawValue - self.rawValue
    if monthsLeft < 0 {
      monthsLeft += 12
    }
    return monthsLeft
  }
}

let month = Month.november
let monthsLeft = month.monthsUntilSummer // 7

/*: ## Challenge 3: Pattern matching enumeration values (Шаблонное сопоставление значений перечислений) */

enum Direction {
  case north
  case south
  case east
  case west
}

let movements: [Direction] = [.north, .north, .west, .south, .west, .south, .south, .east, .east, .south, .east]

var location = (x: 0, y: 0)

for movement in movements {
  switch movement {
  case .north:
    location.y += 1
  case .south:
    location.y -= 1
  case .east:
    location.x += 1
  case .west:
    location.x -= 1
  }
}

let currentX = location.x // 1
let currentY = location.y // -2
