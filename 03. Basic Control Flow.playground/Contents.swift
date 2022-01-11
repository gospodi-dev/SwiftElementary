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

