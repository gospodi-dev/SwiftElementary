/*: # 12. Methods (Методы) */
/*: ## Part 01. Method refresher (Обновление метода) */

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

struct SimpleDate {
  var month: String
  
  func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
    months.firstIndex(of: "December")! -
    months.firstIndex(of: date.month)!
  }
}

let date = SimpleDate(month: "October")
date.monthsUntilWinterBreak(from: date) // 2

// date.monthsUntilWinterBreak() // ошибка: отсутствует аргумент для параметра 'from' в вызове
