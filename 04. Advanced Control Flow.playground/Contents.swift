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
