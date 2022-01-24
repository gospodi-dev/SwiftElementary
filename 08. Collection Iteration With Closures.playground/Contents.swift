/*: ## Closures (Замыкания) */
/*: ### Closure basics (Основы замыкания) */
// var multiplyClosure: (Int, Int) -> Int
var multiplyClosure = { (a: Int, b: Int) -> Int in
  return a * b // 8
}
let result = multiplyClosure(4, 2) // 8
