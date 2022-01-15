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

