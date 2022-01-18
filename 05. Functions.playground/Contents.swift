import Foundation
import UIKit
/*
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

func printMultipleOf(multiplier: Int, andValue: Int) {
    print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
}
printMultipleOf(multiplier: 4, andValue: 2)
// 4 * 2 = 8

func printMultipleOf(multiplier: Int, and value: Int) {
  print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(multiplier: 4, and: 2)
// 4 * 2 = 8
/
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
 
// Part 3. Return values (Возвращаемые значения)
func multiply(_ number: Int, by multiplier: Int) -> Int {
  return number * multiplier
}
let result = multiply(4, by: 2)
// 8

func multiplyAndDivide(_ number: Int, by factor: Int) -> (product: Int, quotient: Int) {
    return (number * factor, number / factor)
}
let results = multiplyAndDivide(4, by: 2)
let product = results.product // 8
let quotient = results.quotient // 2


func multiply(_ number: Int, by multiplier: Int) -> Int {
  number * multiplier
}
let result = multiply(4, by: 2)

func multiplyAndDivide(_ number: Int, by factor: Int)
                   -> (product: Int, quotient: Int) {
  (number * factor, number / factor)
}
let results = multiplyAndDivide(4, by: 2)
let product = results.product
let quotient = results.quotient


// Part 4. Advanced parameter handling (Расширенная обработка параметров)
func incrementAndPrint(_value: Int) {
    value += 1
    print(value)
}

// a behavior known as copy-in copy-out or call by value result

func incrementAndPrint(_ value: inout Int) {
    value += 1
    print(value)
}

var value = 5
incrementAndPrint(&value)
print(value)
// 6
// 6

// Part 5. Overloading (Перегрузка)
func printMultipleOf(multiplier: Int, andValue: Int)
func printMultipleOf(multiplier: Int, and value: Int)
func printMultipleOf(_ multiplier: Int, and value: Int)
func printMultipleOf(_ multiplier: Int, _ value: Int)
// Вы также можете перегрузить имя функции на основе другого типа возвращаемого значения

func getValue() -> Int {
    31
}

func getValue() -> String {
    "Matt Galloway"
}
// let value = getValue()

// Чтобы исправить эту ситуацию, можно объявить тип, которым должно быть значение
let valueInt: Int = getValue() // 31
let valueString: String = getValue() // "Matt Galloway"

// Functions. Mini-exercises
// 1
func printFullName(firstName: String, lastName: String) {
    print(firstName + " " + lastName)
}
printFullName(firstName: "Serg", lastName: "Delone")
// Serg Delone
// 2
func printFullName(_ firstName: String, _ lastName: String) {
    print(firstName + " " + lastName)
}
printFullName(firstName: "Serg", lastName: "Delone")
// Serg Delone
// 3
func calculateFullName(_ firstName: String, _ lastName: String) -> String {
    firstName + " " + lastName
}
let fullName = calculateFullName("Serg", "Delone")
// Serg Delone

// 4
func calculateFullNameWithLength(_ firstName: String, _ lastName: String) -> (name: String, length: Int) {
  let fullName = firstName + " " + lastName
  return (fullName, fullName.count)
}
let fullNameLength = calculateFullNameWithLength("Serg", "Delone").length
// 13

// Part 6. Functions as variables (Функции как переменные)
func add(_ a: Int, _ b: Int) -> Int {
    a + b
}
var function = add
function(4, 2) // 6

func subtract(_ a: Int, _ b: Int) -> Int {
    a - b
}
function = subtract
function(4, 2) // 2

func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = function(a, b)
    print(result)
}
printResult(add, 4, 2) // 6

// Part 7. Commenting your functions (Комментирование функций)
/// Calculates the average of three values
/// - Parameters:
///   - a: The first value.
///   - b: The second value.
///   - c: The third value
/// - Returns: The average of the three values.
func calculateAverage(of a: Double, and b: Double, and c: Double) -> Double {
    let total = a + b + c // 9
    let average = total / 3 // 3
    return average
}
calculateAverage(of: 1, and: 3, and: 5) // 3
 */
// Functions. Challenges
// Challenge 1: Looping with stride functions (зацикливание с функцией шага)
for index in stride(from: 10, to: 22, by: 4) {
    print(index)
}
//10
//14
//18

for index in stride(from: 10, through: 22, by: 4) {
    print(index)
}
//10
//14
//18
//22
// stride(from:to:by:) does NOT include the final number (like half-open range)
// stride(from:through:by:) does include the final number (like closed range)
// шаг(от:до:по:) НЕ включает конечное число (например, полуоткрытый диапазон)
// шаг(от:через:по:) включает конечное число (например, закрытый диапазон)
for index in stride(from: 10, through: 9, by: -0.1) {
    print(index)
}
//10.0
//9.9
//9.8
//9.7
//9.6
//9.5
//9.4
//9.3
//9.2
//9.1
//9.0
