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
