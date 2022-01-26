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

/*: ### Part2. Grapheme clusters (Графемные кластеры) */
//: a grapheme cluster
let cafeNormal = "café"
let cafeCombining = "cafe\u{0301}"
cafeNormal.count // 4
cafeCombining.count // 4

cafeNormal.unicodeScalars.count     // 4
cafeCombining.unicodeScalars.count  // 5

for codePoint in cafeCombining.unicodeScalars {
    print(codePoint.value)
}
// 99
// 97
// 102
// 101
// 769
