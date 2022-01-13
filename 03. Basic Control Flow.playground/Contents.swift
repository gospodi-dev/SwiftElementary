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
//let a = 5
//let b = 10
//
//let min = a < b ? a : b // 5
//let max = a > b ? a : b // 10

// IF STATEMENTS. Мини-упражнения (Mini-exercises)
// 1
//let myAge = 39
//if myAge >= 13 && myAge <= 19 {
//    print("Teenager")
//} else {
//    print("Not a teenager")
//}
//// 2
//let answer = myAge >= 13 && myAge <= 19 ? "Teenager" : "Not a teenager"
//print(answer)

// Part 8. While loops (Циклы While)

/* Cтруктура while цикла
 while <CONDITION> {
    <LOOP CODE>
 }
 */
/*
бесконечный цикл (an infinite loop)
while true { }
*/

//  An example of the game Snakes and Ladders
//let finalSquare = 25
//var board = [Int] (repeating: 0, count: finalSquare + 1)
////  для обозначения лестниц и змей, некоторым квадратам присваиваются специальные значения
//board[03] = +08;
//board[06] = +11;
//board[09] = +09;
//board[10] = +02
//board[14] = -10;
//board[19] = -11;
//board[22] = -02;
//board[24] = -08
////  Например, квадрат 3 с основанием лестницы перемещает вас вверх на 11 квадрат.
//var square = 0
//var diceRoll = 0
//while square < finalSquare {
//    // бросок кубика
//    diceRoll += 1
//    if diceRoll == 7 {
//        diceRoll = 1
//    } // начать ходить на выпавшее количество шагов
//    square += diceRoll
//    if square < board.count {
//        // если мы все еще на поле, идти вверх или вниз по змеям или лестницам
//        square += board[square]
//    }
//}
//print("Game over!")

//var sum = 1
//
//while sum < 1000 {
//    sum = sum + (sum + 1)
//}

// Part 9. Циклы с повторением (Repeat-while loops)

// repeat-while цикл
//repeat {
//  <LOOP CODE>
//} while <CONDITION>

//sum = 1
//
//repeat {
//    sum = sum + (sum + 1)
//} while sum < 1000
//
//sum = 1
//
//while sum < 1 {
//  sum = sum + (sum + 1)
//}
//// 1
//
//sum = 1
//
//repeat {
//  sum = sum + (sum + 1)
//} while sum < 1
// 3

//  An example of the game Snakes and Ladders (for repeat-while loop)
//let finalSquare = 25
//var board = [Int](repeating: 0, count: finalSquare + 1)
//board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
//board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
//var square = 0
//var diceRoll = 0
//
//repeat {
//  // идти вверх или вниз по змеям или лестницам
//  square += board[square]
//  // бросить кубик
//  diceRoll += 1
//  if diceRoll == 7 { diceRoll = 1 }
//  // начать ходить на выпавшее количество шагов
//  square += diceRoll
//} while square < finalSquare
//print("Game over!")


// Breaking out of a loop (Выход из цикла)

//sum = 1
//
//while true {
//  sum = sum + (sum + 1)
//  if sum >= 1000 {
//    break
//  }
//}

// Следующий пример переключается на символьные значение Character и определяет, является ли символ целым числом на одном из четырех языков.

let numberSymbol: Character = "三"  // Цифра 3 в упрощенном Китайском языке
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}
// Выведет "The integer value of 三 is 3."

// WHILE LOOPS. Mini-exercises
// 1
/*
var counter = 0

while counter < 10 {
    print("counter is \(counter)")
    counter += 1
}
//counter is 0
//counter is 1
//counter is 2
//counter is 3
//counter is 4
//counter is 5
//counter is 6
//counter is 7
//counter is 8
//counter is 9
*/

// 2
var counter = 0
var roll = 0

repeat {
    roll = Int.random(in: 0...5)
    counter += 1
    print("After \(counter) roll(s), roll is \(roll)")
} while roll != 0
// After 1 roll(s), roll is 5
// After 2 roll(s), roll is 5
// After 3 roll(s), roll is 5
// After 4 roll(s), roll is 2
// After 5 roll(s), roll is 4
// After 6 roll(s), roll is 3
// After 7 roll(s), roll is 1
// After 8 roll(s), roll is 5
// After 9 roll(s), roll is 3
// After 10 roll(s), roll is 4
// After 11 roll(s), roll is 4
// After 12 roll(s), roll is 4
// After 13 roll(s), roll is 2
// After 14 roll(s), roll is 0


// Challenges

// Challenge 1: Find the error (Найдите ошибку)
// What’s wrong with the following code? (Что не так со следующим кодом?)

//let firstName = "Ivan"
//
//if firstName == "Ivan" {
//    let lastName = "Drago"
//} else if firstName == "Serg" {
//    let lastName = "D\'Crua"
//}
//let fullName = firstName + " " + lastName
// error: cannot find 'lastName' in scope
// `lastName` is no longer in scope when setting `fullName`.
// A correct solution:
let firstName = "Ivan"
var lastName = ""

if firstName == "Ivan" {
    lastName = "Drago"
} else if firstName == "Serg" {
    lastName = "D\'Crua"
}
let fullName = firstName + " " + lastName
// Ivan Drago

// Challenge 2: Boolean challenge (задача на булеву логику)

// let answer = true && true // true
// let answer = false || false // false
// let answer = (true && 1 != 2) || (4 > 3 && 100 < 1) // true
let answer = ((10 / 2) > 3) && ((10 % 2) == 0) // true

// Challenge 3: Snakes and ladders

let currentPosition = 5
let diceRoll = 6

var nextPosition = currentPosition + diceRoll // 11
if nextPosition == 3 {
    nextPosition = 15
} else if nextPosition == 7 {
    nextPosition = 12
} else if nextPosition == 11 {
    nextPosition = 2
} else if nextPosition == 17 {
    nextPosition = 9
}

print("Board position after \(currentPosition) is \(nextPosition)")
// Board position after 5 is 2

// Challenge 4: Number of days in a month (количество дней в месяце)
let month = "apr"
let year = 2022

var days = 0
if month == "jan" || month == "mar" || month == "may" || month == "jul" || month == "aug" || month == "oct" || month == "dec" {
  days = 31
} else if month == "apr" || month == "jun" || month == "sep" || month == "nov" {
  days = 30
} else if month == "feb" {
  if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
    days = 29
  } else {
    days = 28
  }
}

if days > 0 {
  print("\(month) has 30 days")
} else {
  print("Invalid month!")
}
// apr has 30 days

// Challenge 5: Next power of two (следующая степень двойки)
let number = 946
var trial = 1
var times = 0
while trial < number {
  trial = trial * 2
  times += 1
}
print("Next power of 2 >= \(number) is \(trial) which is 2 to the power of \(times)")
// Next power of 2 >= 946 is 1024 which is 2 to the power of 10

// Challenge 6: Triangular number
var depth = 5
var count = 1
var triangularNumber = 0
while count <= depth {
  triangularNumber += count
  count += 1
}
print("Triangular number with depth \(depth) is \(triangularNumber)")
// Triangular number with depth 5 is 15

// Challenge 7: Fibonacci
let n = 10
var current = 1
var previous = 1
var done = 2
while done < n {
  let next = current + previous
  previous = current
  current = next
  done += 1
}
print("Fibonacci number \(n) is \(current)")
// Fibonacci number 10 is 55

// Challenge 8: Make a loop (создать цикл)
let factor = 7

var i = 0
var accumulator = 0
while i <= 12 {
  print("\(factor) x \(i) = \(accumulator)")
  accumulator += 7
  i += 1
}
//7 x 0 = 0
//7 x 1 = 7
//7 x 2 = 14
//7 x 3 = 21
//7 x 4 = 28
//7 x 5 = 35
//7 x 6 = 42
//7 x 7 = 49
//7 x 8 = 56
//7 x 9 = 63
//7 x 10 = 70
//7 x 11 = 77
//7 x 12 = 84

// Challenge 9: Dice roll table (Таблица броска игральных костей)
var target = 2

while target <= 12 {
  var combinationsFound = 0
  var valueOnFirstDice = 1
  while valueOnFirstDice <= 6 {
    var valueOnSecondDice = 1
    while valueOnSecondDice <= 6 {
      if valueOnFirstDice + valueOnSecondDice == target {
        combinationsFound += 1
      }
      valueOnSecondDice += 1
    }
    valueOnFirstDice += 1
  }

  print("\(target):\t\(combinationsFound)")

  target += 1
}
//2:    1
//3:    2
//4:    3
//5:    4
//6:    5
//7:    6
//8:    5
//9:    4
//10:    3
//11:    2
//12:    1
