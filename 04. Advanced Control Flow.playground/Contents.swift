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
let count = 10
var sum = 0
for i in 1...count {
    sum += 1
}

sum = 1
var lastSum = 0

for _ in 0..<count {
  let temp = sum
  sum = sum + lastSum
  lastSum = temp
}

sum = 0
for i in 1...count where i % 2 == 1 {
    sum += i
}

// Part 3. Continue and labeled statements

sum = 0

for row in 0..<8 {
    if row % 2 == 0 {
        continue
    }
    
    for column in 0..<8 {
        sum += row * column
    }
}
sum = 0

rowLoop: for row in 0..<8 {
columnLoop: for column in 0..<8 {
    if row == column {
        continue rowLoop
    }
    sum += row * column
    }
}
