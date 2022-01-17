import Foundation
import UIKit

// Part 1. Function basics (Основы работы)

func printMyName() {
    print("My name is Matt Galloway")
}
printMyName()
// My name is Matt Galloway

// Part 2. Function parameters (Параметры функции)
func printMultipleOfFive(value: Int) {
    print("\(value) * 5 = \(value * 5)")
}
printMultipleOfFive(value: 10)
// 10 * 5 = 50

//func printMultipleOf(multiplier: Int, andValue: Int) {
//    print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
//}
//printMultipleOf(multiplier: 4, andValue: 2)
//// 4 * 2 = 8
//
//func printMultipleOf(multiplier: Int, and value: Int) {
//  print("\(multiplier) * \(value) = \(multiplier * value)")
//}
//printMultipleOf(multiplier: 4, and: 2)
//// 4 * 2 = 8
///
// Если вы хотите вообще не иметь внешнего имени, то можно использовать знак подчеркивания "_"
func printMultipleOf(_ multiplier: Int, and value: Int) {
  print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4, and: 2)
// 4 * 2 = 8

func printMultipleOf(_ multiplier: Int, _ value: Int) {
  print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4, 2)
// 4 * 2 = 8

// Вы также можете присвоить параметрам значения по умолчанию
func printMultipleOf(_ multiplier: Int, _ value: Int = 1) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4)
// 4 * 1 = 4

