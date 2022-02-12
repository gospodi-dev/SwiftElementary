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
 */
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

