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

/*: ### Part 2. Grapheme clusters (Графемные кластеры) */
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

/*: ### Part 3. Indexing strings (Индексирование строк) */
let firstIndex = cafeCombining.startIndex // String.Index
let firstChar = cafeCombining[firstIndex] // c

// let lastIndex = cafeCombining.endIndex
// let lastChar = cafeCombining[lastIndex] // Swift/StringRangeReplaceableCollection.swift:302: Fatal error: String index is out of bounds (Фатальная ошибка: Строковый индекс вышел за границы)

let lastIndex = cafeCombining.index(before: cafeCombining.endIndex) // String.Index
let lastChar = cafeCombining[lastIndex] // "é"

// В качестве альтернативы можно выполнить смещение от первого символа
let fourthIndex = cafeCombining.index(cafeCombining.startIndex,
                                      offsetBy: 3)
let fourthChar = cafeCombining[fourthIndex]

fourthChar.unicodeScalars.count //  2
fourthChar.unicodeScalars.forEach { codePoint in
    print(codePoint.value)
}
// 101
// 769

/*: ### Part 4. Indexing strings (Индексирование строк) */
let equal = cafeNormal == cafeCombining // true

/*: ### Part 5. Strings as bi-directional collections (Строки как двунаправленные коллекции) */
let name = "Matt"
let backwardsName = name.reversed() // ReversedCollection<String>

let secondCharIndex = backwardsName.index(backwardsName.startIndex,
                                          offsetBy: 1) // ReversedCollection<String>.Index
let secondChar = backwardsName[secondCharIndex] // "t"
let backwardsNameString = String(backwardsName) // "ttaM"
