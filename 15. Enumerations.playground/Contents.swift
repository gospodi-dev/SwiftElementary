/*: # Глава 15. Enumerations (Перечисления) */
/*: ## Part 01. Declaring an enumeration (Объявление перечисления) */

let months = ["January", "February", "March", "April", "May",
              "June", "July", "August", "September", "October",
              "November", "December"]

func semester(for month: String) -> String {
  switch month {
  case "August", "September", "October", "November", "December":
    return "Autumn"
  case "January", "February", "March", "April", "May":
    return "Spring"
  default:
    return "Not in the school year"
  }
}

semester(for: "April")
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

