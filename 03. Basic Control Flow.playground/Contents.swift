import UIKit

// Part 1. Boolean operators (Логические операторы)

//let yes: Bool = true
//let no: Bool = false
// вы можете не указывать аннотацию типа
let yes = true
let no = false

// let doesOneEqualTwo = (1 == 2) // false
let doesOneEqualTwo = (1 != 2) // true
// другой способ проверки
let alsoTrue = !(1 == 2) // true

// Операторы сравнения часто используются в условных выражениях, включая инструкцию if

let name = "world"
if name == "world" {
    print("Hello, world")
} else {
    print("Мне жаль, \(name), но я тебя не узнаю ")
}
// напечатает "Hello, world", так как name очевидно равно "world"

let isOneGreaterThanTwo = (1 > 2) // false
let isOneLessThanTwo = (1 < 2) // true

//Каждый оператор сравнения возвращает значение типа Bool, указывающее, является ли выражение истинным:

1 == 1 // true
2 != 1 // true
2 > 2 // false
1 < 2 // true
1 >= 1 // true
2 <= 1 // false

// Part 2. Boolean logic (Булева логика)
// И (AND) &&
let and = true && true // true
//В этом случае and будет true. Если бы любое из значений справа было false, то and было бы false.
// ИЛИ (OR) ||
let or = true || false // true

let andTrue = 1 < 2 && 4 > 3 // true
let andFalse = 1 < 2 && 3 > 4 // false
let orTrue = 1 < 2 || 3 > 4 // true
let orFalse = 1 == 2 || 3 == 4 // false

let andOr = (1 < 2 && 3 > 4) || 1 < 4 // true
//1. (1 < 2 && 3 > 4) || 1 < 4
//2. (true && false) || true
//3. false || true
//4. true

// Part 3. String equality and Toggling a Bool (Строковое равенство и переключения)
let guess = "dog"
let dogEqualsCat = guess == "cat" // false, потому "dog" что не равно "cat"

// let order = "cat" < "dog" // true, потому что "cat" стоит раньше "dog"

// Переключение Bool (Toggling a Bool)
var switchState = true
switchState.toggle() // false
switchState.toggle() // true

// BOOLEAN LOGIC. Мини-упражнения (Mini-exercises)

// Задача 1.
let myAge = 56
let isTeenager = myAge >= 13 && myAge <= 19 // false

// Задача 2.
let theirAge = 30
let bothTeenagers = theirAge >= 13 && theirAge <= 19 && isTeenager // true
// Задача 3.
let reader = "Serg"
let author = "Мет Галлоувей"
let authorIsReader = reader == author // false

// Задача 4.
let readerBeforeAuthor = reader < author // true

// Part 4. The if statement (Оператор if)
// ЕСЛИ (if)
if 2 > 1 {
    print("Yes, 2 is greater than 1.")
} // Yes, 2 is greater than 1.

// ИНАЧЕ (else)
let animal = "Fox"

if animal == "Cat" || animal == "Dog" {
    print("Animal is a house pet.")
} else {
    print("Animal is not a house pet.")
} // "Animal is not a house pet."

// else-if

let hourOfDay = 12
var timeOfDay = ""

if hourOfDay < 6 {
  timeOfDay = "Early morning"
} else if hourOfDay < 12 {
  timeOfDay = "Morning"
} else if hourOfDay < 17 {
  timeOfDay = "Afternoon"
} else if hourOfDay < 20 {
  timeOfDay = "Evening"
} else if hourOfDay < 24 {
  timeOfDay = "Late evening"
} else {
  timeOfDay = "INVALID HOUR!"
}
print(timeOfDay) // Afternoon

// Part 5. Short-circuiting (Короткое замыкание)
if 1 > 2 && name == "Matt Galloway" {
    // ...
} // false

if 1 < 2 || name == "Matt Galloway" {
    // ...
} // true

// Part 6. Encapsulating variables (Инкапсуляция переменных)
//Вы зарабатываете 25 долларов за каждый час до 40 часов и 50 долларов за каждый час после этого. Рассчитайте комиссию
var hoursWorked = 45
var price = 0

if hoursWorked > 40 {
    let hoursOver40 = hoursWorked - 40 // 5
    price += hoursOver40 * 50 // 250
    hoursWorked -= hoursOver40 // 40
}
price += hoursWorked * 25 // 1250

print(price)

// print(hoursOver40) // error: cannot find 'hoursOver40' in scope

// Part 7. Тернарный условный оператор (The ternary conditional operator)
// Нужно определить минимум и максимум двух переменных
//let a = 5
//let b = 10
//
//let min: Int
//if a < b {
//    min = a
//} else {
//    min = b
//} // 5
//
//let max: Int
//if a > b {
//  max = a
//} else {
//  max = b
//} // 10
// перепишем код с помощью использования тернарного оператора
let a = 5
let b = 10

let min = a < b ? a : b // 5
let max = a > b ? a : b // 10

