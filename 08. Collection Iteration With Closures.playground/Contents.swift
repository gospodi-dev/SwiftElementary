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

/*: ### Custom sorting with closures (Пользовательская сортировка с закрытием) */
let names = ["ZZZZZZ", "BB", "A", "CCCC", "EEEEE"]
names.sorted()
// ["A", "BB", "CCCC", "EEEEE", "ZZZZZZ"]
names.sorted {
  $0.count > $1.count
}
print(names)
// ["ZZZZZZ", "BB", "A", "CCCC", "EEEEE"]

