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
