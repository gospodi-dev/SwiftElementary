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
*/
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
