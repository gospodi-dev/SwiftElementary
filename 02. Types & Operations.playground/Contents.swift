import UIKit

// Part 1. Type conversion (Преобразование типов)

var integer: Int = 100
var decimal: Double = 12.5
// Нужно преобразовать выражения к типу Int
integer = Int(decimal) // 12

// Операторы со смешанными типами (Operators with mixed types)
let hourlyRate: Double = 19.5
let hoursWorked: Int = 10
let totalCost: Double = hourlyRate * Double(hoursWorked)

// Вывод типа (Type inference)
let typeInferredInt = 42
let typeInferredDouble = 3.14159

let wantADouble = 3
//let actuallyDouble = Double(3)
//let actuallyDouble: Double = 3
let actuallyDouble = 3 as Double

// TYPES. Мини-упражнения (Mini-exercises)

let age1 = 42
let age2 = 21

let avg1 = (age1 + age2) / 2 // 31
// Оба операнда / являются целыми числами, поэтому операция представляет собой целочисленное деление, а результат усекается.

let avg2 = (Double(age1) + Double(age2)) / 2 // 31.5
// Первый операнд / теперь является двойным. Из-за этого 2 также считается двойным, и результат правильный.

// Part 2. Strings (Строки)

// Символы и строки (Characters and strings)
let characterA: Character = "a"
let characterDog: Character = "🐶"

let stringDog = "Dog" // Inferred to be of type String (Предполагается, что он имеет тип String)

// 2.1. Конкатенация (Concatenation)

var message = "Hello" + " my name is "
let name = "Matt"
message += name // "Hello my name is Matt"

let exclamationMark: Character = "!"
message += String(exclamationMark) // "Hello my name is Matt!"

// 2.2. Интерполяция (Interpolation)

message = "Hello my name is \(name)!" // "Hello my name is Matt!"

let oneThird = 1.0 / 3.0 // 0.3333333333333333
let oneThirdLongString = "One third is \(oneThird) as a decimal." // "One third is 0.3333333333333333 as a decimal." (Одна треть составляет 0,3333333333333333 в десятичном виде.)

let multiplier = 3
let messages = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)" // "3 times 2.5 is 7.5"

// 2.3. Многострочные строки (Multi-line strings)

/*
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2 // "hello there"

let exclamationMark: Character = "!"
welcome.append(exclamationMark) // "hello there!"

let badStart = """
one
two
"""

let end = """
three
"""
print(badStart + end)
// one
// twothree

let goodStart = """
one
two

"""
print(goodStart + end)
// one
// two
// three
*/

let bigString = """
  You can have a string
  that contains multiple
  lines
  by
  doing this.
  """
print(bigString)
//You can have a string
//that contains multiple
//lines
//by
//doing this.


// STRINGS. Мини-упражнения (Mini-exercises)

let firstName: String = "Serg"
let lastName: String = "Piccalo"
let fullName = firstName + " " + lastName // Serg Piccalo
let myDetails = "Hello, my name is \(fullName)." // "Hello, my name is Serg Piccalo."

// Part 3. Tuples (Кортежи)

// let coordinates: (Int, Int) = (2, 3)
let coordinates = (2, 3)
let coordinatesDouble = (2.1, 3.5)
// Inferred to be of type (Double, Double) (Предположительно относится к типу ... )

let coordinatesMixed = (2.1, 3)
// Inferred to be of type (Double, Int)

// Получаем доступ к данным в кортеже
let x1 = coordinates.0 // 2
let y1 = coordinates.1 // 3

let coordinatesNamed = (x: 2, y: 3) // Inferred to be of type (x: Int, y: Int)

// доступ к части кортежа по имени
let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y

// сокращенный синтаксис доступа к нескольким частям кортежа
let coordinates3D = (x: 2, y: 3, z: 1)
let (x3, y3, z3) = coordinates3D
// код выше эквивалентен следующему
//let x3 = coordinates3D.x
//let y3 = coordinates3D.y
//let z3 = coordinates3D.z

// синтаксис игнорирования определенного элемента кортежа
let (x4, y4, _) = coordinates3D

// TUPLES. Мини-упражнения (Mini-exercises)

// let temperature = (10, 01, 2022, 34.5)
// let temperature = (month: 10, day: 01, year: 2022, averageTemperature: 34.5)
var temperature = (month: 10, day: 01, year: 2022, averageTemperature: 34.5)
let (_, day, _, averageTemperature) = temperature
temperature.averageTemperature = 21.2


// Part 4. Псевдонимы типов (Type aliases)
typealias Animal = String
let myPet: Animal = "Dog"

typealias Coordinates = (Int, Int)
let xy: Coordinates = (2, 4)

