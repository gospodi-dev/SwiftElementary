/*: ## 09. String (Строки) */
/*: ### Part 1. Strings as collections (Строки как коллекции)*/
let string = "Matt"
for char in string {
    print(char)
}
//M
//a
//t
//t

let stringLength = string.count
print(stringLength) // 4

//  let fourthChar = string[3] // error: 'subscript(_:)' is unavailable: cannot subscript String with an Int, use a String.Index instead. (ошибка: 'subscript(_:)' недоступна: невозможно подзаписать String с Int, вместо этого используйте String.Index.)

