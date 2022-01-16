import Foundation
import UIKit

// Part 1. Countable ranges (Счетные диапазоны)
// счетный замкнутый диапазон (countable closed range)
let closedRange = 0...5
//  Три точки ( ...) указывают на то, что этот диапазон закрыт, что означает, что диапазон изменяется от 0 до 5 включительно. Это цифры 0, 1, 2, 3, 4, 5

// счетный полуоткрытый диапазон (countable half-open range)
let halfOpenRange = 0..<5

// A random interlude (Случайная интерлюдия)
while Int.random(in: 1...6) != 6 {
    print("Not a six")
}
// Part 2. For loops (Циклы for)
//for <CONSTANT> in <COUNTABLE RANGE> {
//  <LOOP CODE>
//}
//let count = 10
//var sum = 0
//for i in 1...count {
//    sum += 1
//}
//
//sum = 1
//var lastSum = 0
//
//for _ in 0..<count {
//  let temp = sum
//  sum = sum + lastSum
//  lastSum = temp
//}
//
//sum = 0
//for i in 1...count where i % 2 == 1 {
//    sum += i
//}

// Part 3. Continue and labeled statements

//sum = 0
//
//for row in 0..<8 {
//    if row % 2 == 0 {
//        continue
//    }
//
//    for column in 0..<8 {
//        sum += row * column
//    }
//}
//sum = 0
//
//rowLoop: for row in 0..<8 {
//columnLoop: for column in 0..<8 {
//    if row == column {
//        continue rowLoop
//    }
//    sum += row * column
//    }
//}

// FOR LOOPS. Mini-exercises
// 1
let range = 1...10
for i in range {
  let square = i * i
  print("\(square)")
}
//answer
//1
//4
//9
//16
//25
//36
//49
//64
//81
//100

// 2
for i in range {
  let squareRoot = sqrt(Double(i))
  print("\(squareRoot)")
}

//1.0
//1.4142135623730951
//1.7320508075688772
//2.0
//2.23606797749979
//2.449489742783178
//2.6457513110645907
//2.8284271247461903
//3.0
//3.1622776601683795

// 3
var sum = 0
for row in 0..<8 where row % 2 == 1 {
  for column in 0..<8 {
    sum += row * column
  }
}

// Part 4. Switch statements (Операторы переключения)
let number = 10

switch number {
case 0:
    print("Zero")
default:
    print("Non-zero")
}
// Non-zero

switch number {
case 10:
    print("It's ten!")
default:
    break
}
// It's ten!

let string = "Dog"
switch string {
case "Cat", "Dog":
    print("Animal is a house pet.")
default:
    print("Animal is not a house pet.")
}
// Animal is a house pet.

// Advanced switch statements (Расширенные операторы переключения)

let hourOfDay = 12
var timeOfDay = ""

//switch hourOfDay {
//case 0, 1, 2, 3, 4, 5:
//  timeOfDay = "Early morning"
//case 6, 7, 8, 9, 10, 11:
//  timeOfDay = "Morning"
//case 12, 13, 14, 15, 16:
//  timeOfDay = "Afternoon"
//case 17, 18, 19:
//  timeOfDay = "Evening"
//case 20, 21, 22, 23:
//  timeOfDay = "Late evening"
//default:
//  timeOfDay = "INVALID HOUR!"
//}
//
//print(timeOfDay)
// Afternoon

// можно переписать приведенный выше код, используя диапазоны:
switch hourOfDay {
case 0...5:
  timeOfDay = "Early morning"
case 6...11:
  timeOfDay = "Morning"
case 12...16:
  timeOfDay = "Afternoon"
case 17...19:
  timeOfDay = "Evening"
case 20..<24:
  timeOfDay = "Late evening"
default:
  timeOfDay = "INVALID HOUR!"
}
// Afternoon

switch number {
case let x where x % 2 == 0:
    print("Even")
default:
    print("Odd")
}
// Even
switch number {
case _ where number % 2 == 0:
  print("Even")
default:
  print("Odd")
}

// Partial matching (Частичное совпадение)
let coordinates = (x: 3, y: 2, z: 5)

switch coordinates {
case (0, 0, 0): // 1
  print("Origin")
case (_, 0, 0): // 2
  print("On the x-axis.")
case (0, _, 0): // 3
  print("On the y-axis.")
case (0, 0, _): // 4
  print("On the z-axis.")
default:        // 5
  print("Somewhere in space")
}
// Somewhere in space

switch coordinates {
case (0, 0, 0):
  print("Origin")
case (let x, 0, 0):
  print("On the x-axis at x = \(x)")
case (0, let y, 0):
  print("On the y-axis at y = \(y)")
case (0, 0, let z):
  print("On the z-axis at z = \(z)")
case let (x, y, z):
  print("Somewhere in space at x = \(x), y = \(y), z = \(z)")
}

// Somewhere in space at x = 3, y = 2, z = 5

switch coordinates {
case let (x, y, _) where y == x:
  print("Along the y = x line.")
case let (x, y, _) where y == x * x:
  print("Along the y = x^2 line.")
default:
  break
}
