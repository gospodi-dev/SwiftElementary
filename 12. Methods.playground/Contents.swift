/*: # 12. Methods (Методы) */
/*: ## Part 01. Method refresher (Обновление метода) */
/*
 var numbers = [1, 2, 3]
 numbers.removeLast()
 print(numbers) // [1, 2]
 
 //: ### Turning a function into a method (Превращение функции в метод)
 
 let months = ["January", "February", "March",
 "April", "May", "June",
 "July", "August", "September",
 "October", "November", "December"]
 
 //struct SimpleDate {
 //    var month: String
 //}
 //
 //func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
 //    months.firstIndex(of: "December")! -
 //    months.firstIndex(of: date.month)!
 //}
 
 // Создать метод так же просто, как переместить функцию внутрь определения структуры
 
 //struct SimpleDate {
 //  var month: String
 //
 //  func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
 //    months.firstIndex(of: "December")! -
 //    months.firstIndex(of: date.month)!
 //  }
 //}
 
 //let date = SimpleDate(month: "October")
 //date.monthsUntilWinterBreak(from: date) // 2
 
 // date.monthsUntilWinterBreak() // ошибка: отсутствует аргумент для параметра 'from' в вызове
 
 /*: ## Part 02. Introducing self (Представляем self)  */
 
 struct SimpleDate {
 var month: String
 // 1
 func monthsUntilWinterBreak() -> Int {
 // 2
 //      months.firstIndex(of: "December")! -
 //        months.firstIndex(of: self.month)!
 // 3
 months.firstIndex(of: "December")! -
 months.firstIndex(of: month)!
 }
 
 }
 
 let date = SimpleDate(month: "October")
 date.monthsUntilWinterBreak() // 2
 
 */

/*: ### Methods Mini-exercise, Months Until Winter Break */

let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

//struct SimpleDate {
//  var month: String
//
//  var monthsUntilWinterBreak: Int {
//    months.firstIndex(of: "December")! - months.firstIndex(of: month)!
//  }
//}
//
//let date = SimpleDate(month: "October")
//date.monthsUntilWinterBreak // 2

/*: ## Part 03. Introducing initializers (Знакомство с инициализаторами) */
/*
 struct SimpleDate {
 var month: String
 
 init() {
 month = "January"
 }
 
 func monthsUntilWinterBreak() -> Int {
 months.firstIndex(of: "December")! -
 months.firstIndex(of: month)!
 }
 }
 
 // let date = SimpleDate(month: "October") // Error!
 
 let date = SimpleDate()
 date.month // "January
 date.monthsUntilWinterBreak() // 11
 */
//: Initializers in structures (Инициализаторы в структурах)
/*
struct SimpleDate {
    var month: String
    var day: Int
    
    init() {
        month = "January"
        day = 1
    }
    
    init(month: String, day: Int) {
        self.month = month
        self.day = day
    }
    
    
    func monthsUntilWinterBreak() -> Int {
        months.firstIndex(of: "December")! -
        months.firstIndex(of: month)!
    }
}

let valentinesDay = SimpleDate(month: "February", day: 14)
valentinesDay.month // February
valentinesDay.day // 14

//: Default values and initializers (Значения по умолчанию и инициализаторы)

struct SimpleDate {
  // 1
  var month = "January"
  var day = 1
  
  //2
  
  func monthsUntilWinterBreak() -> Int {
    months.firstIndex(of: "December")! -
    months.firstIndex(of: month)!
  }
}

let newYearsDay = SimpleDate()
newYearsDay.month // January
newYearsDay.day // 1

let valentinesDay = SimpleDate(month: "February", day: 14)
valentinesDay.month // February
valentinesDay.day // 14

let octoberFirst = SimpleDate(month: "October")
octoberFirst.month // October
octoberFirst.day // 1

let januaryTwentySecond = SimpleDate(day: 22)
januaryTwentySecond.month // January
januaryTwentySecond.day // 22

/*: ## Part 04. Introducing mutating methods (Внедрение мутирующих методов) */
mutating func advance() {
  day += 1
}
// ошибка: 'mutating' действует только на методы

//: Type methods (Методы типов)

struct Math {
  // 1
  static func factorial(of number: Int) -> Int {
    // 2
    (1...number).reduce(1, *)
  }
}
// 3
Math.factorial(of: 6) // 720


/*: ### Methods Mini-exercise, Nth Triangle */

struct Math {
  static func factorial(of number: Int) -> Int {
    (1...number).reduce(1, *)
  }
  static func triangleNumber(n: Int) -> Int {
    (1...n).reduce(0, +)
  }
}

Math.factorial(of: 5) // 120
Math.triangleNumber(n: 6) // 21

/*: ## Part 05. Adding to an existing structure with extensions (Дополнение существующей структуры с помощью расширений) */

extension Math {
  static func primeFactors(of value: Int) -> [Int] {
    // 1
    var remainingValue = value
    // 2
    var testFactor = 2
    var primes: [Int] = []
    // 3
    while testFactor * testFactor <= remainingValue {
      if remainingValue % testFactor == 0 {
        primes.append(testFactor)
        remainingValue /= testFactor
      }
      else {
        testFactor += 1
      }
    }
    if remainingValue > 1 {
      primes.append(remainingValue)
    }
    return primes
  }
}

Math.primeFactors(of: 81) // [3, 3, 3, 3]

//: Keeping the compiler-generated initializer using extensions (Сохранение инициализатора, сгенерированного компилятором, с помощью расширений)

struct SimpleDate {
  var month = "January"
  var day = 1
  
  func monthsUntilWinterBreak() -> Int {
    months.firstIndex(of: "December")! -
    months.firstIndex(of: month)!
  }
  
  mutating func advance() {
    day += 1
  }
}

extension SimpleDate {
  init(month: Int, day: Int) {
    self.month = months[month-1]
    self.day = day
  }
}

let halloween = SimpleDate(month: 10, day: 31)
halloween.month // October
halloween.day // 31

/*: ## Method Challenges */
/*: ### Challenge 1: Grow a Circle (Вырастить круг) */
//:Given the Circle structure:
struct Circle {
  
  var radius = 0.0

  var area: Double {
    get {
      .pi * radius * radius
    }
    set {
      radius = (newValue / .pi).squareRoot()
    }
  }

  mutating func grow(byFactor factor: Double) {
    area *= factor
  }
  
}

var circle = Circle(radius: 5)
circle.area // 78.54
circle.grow(byFactor: 3)
circle.area // 235.62

/*: ### Challenge 2: A more advanced `advance()` (Более продвинутый advance()) */

let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

struct SimpleDate {
  var month: String
  var day: Int
  
  var totalDaysInCurrentMonth: Int {
    switch month {
    case "January", "March", "May", "July", "August", "October", "December":
      return 31
    case "April", "June", "September", "November":
      return 30
    case "February": // Note: leap years aren't taken into account here (Високосные годы здесь не учитываются.).
      return 28
    default:
      return 0
    }
  }
  
  mutating func advance() {
    // Check for the end of the month (Проверка на конец месяца)
    if day == totalDaysInCurrentMonth {
      // Check for the end of the year
      if month == "December" {
        month = "January"
      } else {
        // Increment the month
        month = months[months.firstIndex(of: month)!.advanced(by: 1)]
      }
      // Start over at the first day of the month (Начните с первого дня месяца)
      day = 1
    } else {
      // It is not the end of the month, just increment the day (Это не конец месяца, а всего лишь приращение дня.)
      day += 1
    }
  }
}

var date = SimpleDate(month: "December", day: 31)
date.advance()
date.month // January
date.day // 1
 */
/*: ### Challenge 3: Odd and Even Math (Математика четных и нечетных чисел) */
struct Math {}

extension Math {
  static func isEven(_ value: Int) -> Bool {
    value % 2 == 0
  }
  static func isOdd(_ value: Int) -> Bool {
    (value + 1) % 2 == 0
  }
}

Math.isOdd(30) // false
Math.isOdd(33) // true
Math.isEven(20) // true
Math.isEven(21) // false

/*: ### Challenge 4: Odd and Even Int (Четные и нечетные Int) */
extension Int {
  var isEven: Bool {
    self % 2 == 0
  }
  var isOdd: Bool {
    (self + 1) % 2 == 0
  }
}

2.isEven // true
3.isEven // false
2.isOdd  // false
3.isOdd  // true

/*: ### Challenge 5: Prime Factors (Прайм-факторы) */
extension Int {
  func primeFactors() -> [Int] {
    var remainingValue = self
    var testFactor = 2
    var primes: [Int] = []
    while testFactor * testFactor <= remainingValue {
      if remainingValue % testFactor == 0 {
        primes.append(testFactor)
        remainingValue /= testFactor
      }
      else {
        testFactor += 1
      }
    }
    if remainingValue > 1 {
      primes.append(remainingValue)
    }
    return primes
  }
}

81.primeFactors() // [3, 3, 3, 3]
18.primeFactors() // [2, 3, 3]
57.primeFactors() // [3, 19]
