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
