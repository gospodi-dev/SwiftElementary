/*: ## Closures (Замыкания) */
/*: ### Closure basics (Основы замыкания) */
// var multiplyClosure: (Int, Int) -> Int
var multiplyClosure = { (a: Int, b: Int) -> Int in
  return a * b // 8
}
let result = multiplyClosure(4, 2) // 8
/*: ### Shorthand syntax (Сокращенный синтаксис) */
//: Вариант 1
multiplyClosure = { (a: Int, b: Int) -> Int in
  a * b
}
//: Вариант 2
multiplyClosure = { (a, b) in
  a * b
}
//: Вариант 3
multiplyClosure = {
  $0 * $1
}
func operateOnNumbers(_ a: Int, _ b: Int,
                      operation: (Int, Int) -> Int) -> Int {
  let result = operation(a, b)
  print(result)
  return result
}
let addClosure = { (a: Int, b: Int) in
  a + b
}
operateOnNumbers(4, 2, operation: addClosure)
// 6
func addFunction(_ a: Int, _ b: Int) -> Int {
  a + b
}
operateOnNumbers(4, 2, operation: addFunction)
// 6
// operateOnNumbers вызывается одинаково, независимо от того, operation является ли это функцией или замыканием.
operateOnNumbers(4, 2, operation: { (a: Int, b: Int) -> Int in
  return a + b
})
// 6

operateOnNumbers(4, 2, operation: { $0 + $1 })
operateOnNumbers(4, 2, operation: +) // 6
operateOnNumbers(4, 2) {
  $0 + $1
}
// 6
/*: ### Multiple trailing closures syntax. Синтаксис множественных завершающих замыканий */
func sequenced(first: ()->Void, second: ()->Void) {
  first()
  second()
}
sequenced {
  print("Hello, ", terminator: "")
} second: {
  print("world.")
}
// Hello, world.
/* Если вы вдруг забудете, как вызвать функцию с помощью замыкания, Xcode поможет вам. Введите имя метода (или заполните его кодом) и дважды нажмите клавишу возврата (press the return key twice). Функция завершения кода заполнит за вас синтаксис замыкания.*/
/*: ### Closures with no return value (Замыкания без возвращаемого значения) */
let voidClosure: () -> Void = {
  print("I'm is awesome!")
}
voidClosure()
// > I'm is awesome!
/*: ### Capturing from the enclosing scope (Захват из охватывающей области) */
var counter = 0
let incrementCounter = {
  counter += 1
}
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()

func countingClosure() -> () -> Int {
  var counter = 0
  let incrementCounter: () -> Int = {
    counter += 1
    return counter
  }
  return incrementCounter
}

let counter1 = countingClosure()
let counter2 = countingClosure()
counter1() // 1
counter2() // 1
counter1() // 2
counter1() // 3
counter2() // 2

/*: ### Custom sorting with closures (Пользовательская сортировка с замыканием) */
let names = ["ZZZZZZ", "BB", "A", "CCCC", "EEEEE"]
names.sorted()
// ["A", "BB", "CCCC", "EEEEE", "ZZZZZZ"]
names.sorted {
  $0.count > $1.count
}
print(names)
// ["ZZZZZZ", "BB", "A", "CCCC", "EEEEE"]

/*: ### Iterating over collections with closures (Перебор коллекций с замыканиями) */
//: Перебираем элементы в коллекции
let values = [1, 2, 3, 4, 5, 6]
values.forEach {
    print("\($0): \($0*$0)")
}
// > 1: 1
// > 2: 4
// > 3: 9
// > 4: 16
// > 5: 25
// > 6: 36

var prices = [1.5, 10, 4.99, 2.30, 8.19]

let largePrices = prices.filter {
  $0 > 5
}
// func filter(_ isIncluded: (Element) -> Bool) -> [Element]
print(largePrices)
// [10.0, 8.19]
let largePrice = prices.first {
  $0 > 5
}
print(largePrices)

let salePrices = prices.map {
  $0 * 0.9
}
print(salePrices)
// [1.35, 9.0, 4.4910000000000005, 2.07, 7.3709999999999996]

let userInput = ["0", "11", "haha", "42"]

let numbers1 = userInput.map {
  Int($0)
}
print(numbers1)
// [Optional(0), Optional(11), nil, Optional(42)]
let numbers2 = userInput.compactMap {
  Int($0)
}
print(numbers2)
// [0, 11, 42]

let userInputNested = [["0", "1"], ["a", "b", "c"], ["🐕"]]
let allUserInput = userInputNested.flatMap {
  $0
}
print(allUserInput)
// ["0", "1", "a", "b", "c", "🐕"]

let sum = prices.reduce(0) {
  $0 + $1
}
print(sum)
// > 26.980000000000004
// Эти функции также можно использовать со словарями
let stock = [1.5: 5, 10: 2, 4.99: 20, 2.30: 5, 8.19: 30]
let stockSum = stock.reduce(0) {
  $0 + $1.key * Double($1.value)
}
print(stockSum)
// > 384.5

let farmAnimals = ["🐎": 5, "🐄": 10, "🐑": 50, "🐶": 1]
let allAnimals = farmAnimals.reduce(into: []) {
  (result, this: (key: String, value: Int)) in
  for _ in 0 ..< this.value {
    result.append(this.key)
  }
}
// Если нужно измельчить массив
let removeFirst = prices.dropFirst() // [10, 4.99, 2.3, 8.19]
let removeFirstTwo = prices.dropFirst(2) // [4.99, 2.3, 8.19]

let removeLast = prices.dropLast() // [1.5, 10, 4.99, 2.3]
let removeLastTwo = prices.dropLast(2) // [1.5, 10, 4.99, 2.3]

let firstTwo = prices.prefix(2) // [1.5, 10]
let lastTwo = prices.suffix(2) // [2.3, 8.19]

prices.removeAll() { $0 > 2 } // prices is now [1.5]
prices.removeAll() // prices is now an empty array (prices теперь является пустым массивом)

/*: ### Lazy collections (Ленивые коллекции) */
// вычислить первые десять простых чисел
func isPrime(_ number: Int) -> Bool {
  if number == 1 { return false } // false
  if number == 2 || number == 3 { return true } // true

  for i in 2...Int(Double(number).squareRoot()) {
    if number % i == 0 { return false }
  }

  return true
}

//var primes: [Int] = []
//var i = 1
//while primes.count < 10 {
//  if isPrime(i) {
//    primes.append(i)
//  }
//  i += 1
//}
//primes.forEach { print($0) }

let primes = (1...).lazy // PrefixSequence<LazyFilterSequence<PartialRangeFrom<Int>>>
  .filter { isPrime($0) }
  .prefix(10)
primes.forEach { print($0) }
//3
//5
//7
//11
//13
//17
//19
//23
//29
