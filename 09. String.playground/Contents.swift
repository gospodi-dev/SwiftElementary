/*
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

/*: ### Part 6. Raw strings (Необработанные строки) */
let raw1 = #"Raw "No Escaping" \(no interpolation!). Use all the \ you want!"#
print(raw1)
// > Raw "No Escaping" \(no interpolation!). Use all the \ you want!

let raw2 = ##"Aren’t we "# clever"##
print(raw2)
// Aren’t we "# clever

let can = "can do that too"
let raw3 = #"Yes we \#(can)!"#
print(raw3)
// > Yes we can do that too!

let multiRaw = #"""
  _____         _  __ _
 / ____|       (_)/ _| |
| (_____      ___| |_| |_
 \___ \ \ /\ / / |  _| __|
 ____) \ V  V /| | | | |_
|_____/ \_/\_/ |_|_|  \__|
"""#
print(multiRaw)

/*: ### Part 7. Substrings (Подстроки) */
let fullName = "Matt Galloway" // "Matt Galloway"
let spaceIndex = fullName.firstIndex(of: " ")! // String.Index
// let firstName = fullName[fullName.startIndex..<spaceIndex] // "Matt"

let firstName = fullName[..<spaceIndex] // "Matt"
let lastName = fullName[fullName.index(after: spaceIndex)...]
// "Galloway"

let lastNameString = String(lastName)

/*: ### Part 8. Character properties (Свойства символов) */
// принадлежит ли символ к набору символов ASCII
let singleCharacter: Character = "x"
singleCharacter.isASCII // true

// пробельный символ (whitespace)
let space: Character = " "
space.isWhitespace // true

// проверка - является ли символ шестнадцатеричной цифрой
let hexDigit: Character = "d"
hexDigit.isHexDigit // true

let thaiNine: Character = "๙"
thaiNine.wholeNumberValue // 9

/*: ### Part 9. Encoding (Кодировка) */
//: UTF-8
let char = "\\u{00bd}"
for i in char.utf8 {
    print(i)
}
// 92
// 117
// 123
// 48
// 48
// 98
// 100
// 125

// +½⇨🙃
let characters = "+\\u{00bd}\\u{21e8}\\u{1f643}"
for i in characters.utf8 {
  print("\\(i) : \\(String(i, radix: 2))")
}
// \(i) : \(String(i, radix: 2))
// 43 : 101011
//
// 194 : 11000010
// 189 : 10111101
//
// 226 : 11100010
// 135 : 10000111
// 168 : 10101000
//
// 240 : 11110000
// 159 : 10011111
// 153 : 10011001
// 131 : 10000011

//: UTF-16
for i in characters.utf16 {
  print("\\(i) : \\(String(i, radix: 2))")
}
// \(i) : \(String(i, radix: 2))
// 43 : 101011
//
// 189 : 10111101
//
// 8680 : 10000111101000
//
// 55357 : 1101100000111101
// 56899 : 1101111001000011

/*: ### Part 10. Converting indexes between encoding views (Преобразование индексов между представлениями кодировки) */
let arrowIndex = characters.firstIndex(of: "\\u{21e8}")!
characters[arrowIndex] // ⇨

if let unicodeScalarsIndex = arrowIndex.samePosition(in: characters.unicodeScalars) {
  characters.unicodeScalars[unicodeScalarsIndex] // 8680
}

if let utf8Index = arrowIndex.samePosition(in: characters.utf8) {
  characters.utf8[utf8Index] // 226
}

if let utf16Index = arrowIndex.samePosition(in: characters.utf16) {
  characters.utf16[utf16Index] // 8680
}
 */
/*: ## Challenges */
/*: ### Challenge 1: Character count (Количество символов) */
func printCharacterCount(for string: String) {
  guard string.count > 0 else { return }

  var counts: [Character: Int] = [:]

  for i in string {
    counts[i, default: 0] += 1
  }

  let sortedKeys = counts.keys.sorted { counts[$0]! > counts[$1]! }

  let max = counts[sortedKeys.first!]!

  for key in sortedKeys {
    let value = counts[key]!
    let widthOfHashes = (value * 20) / max
    let hashes = String(repeating: "#", count: widthOfHashes)
    print("\(key) : \(hashes) \(value)")
  }
}

printCharacterCount(for: "The quick brown fox jumps over the lazy dog")
//: #################### 8
//o : ########## 4
//e : ####### 3
//h : ##### 2
//u : ##### 2
//r : ##### 2
//q : ## 1
//a : ## 1
//k : ## 1
//x : ## 1
//v : ## 1
//g : ## 1
//n : ## 1
//m : ## 1
//j : ## 1
//t : ## 1
//s : ## 1
//T : ## 1
//z : ## 1
//y : ## 1
//b : ## 1
//p : ## 1
//i : ## 1
//w : ## 1
//c : ## 1
//d : ## 1
//f : ## 1
//l : ## 1

/*: ### Challenge 2: Word count (Подсчёт слов) */
func numberOfWords(in sentence: String) -> Int {
  var count = 0
  var inWord = false

  for character in sentence {
    if character == " " {
      if inWord {
        count += 1
      }
      inWord = false
    } else {
      inWord = true
    }
  }

  // We need to add 1 to count the final word if there was at least 1 character (Нужно добавить 1 для подсчета последнего слова, если в нем был хотя бы 1 символ)
  if inWord {
    count += 1
  }

  return count
}

let wordCount = numberOfWords(in: "The quick brown fox jumps over the lazy dog")
print(wordCount)
// > 9

/*: ### Challenge 3: Name formatter (Форматирование имени) */
func sanitized(name: String) -> String? {
  guard let indexOfComma = name.firstIndex(of: ",") else {
    return nil
  }

  let lastNameSubstring = name[..<indexOfComma]
  let firstNameSubstring = name[indexOfComma...].dropFirst(2)

  return firstNameSubstring + " " + lastNameSubstring
}

if let sanitizedName = sanitized(name: "Galloway, Matt") {
  print(sanitizedName)
}
// > Matt Galloway

/*: ### Challenge 4: Components (Компоненты) */
func splitting(_ string: String, delimiter: Character) -> [String] {
  var returnArray: [String] = []
  var lastWordIndex = string.startIndex

  for i in string.indices {
    if string[i] == delimiter {
      let substring = string[lastWordIndex..<i]
      returnArray.append(String(substring))
      lastWordIndex = string.index(after: i)
    }
  }

  // Add the final word
  let substring = string[lastWordIndex..<string.endIndex]
  returnArray.append(String(substring))

  return returnArray
}

let pieces = splitting("Dog,Cat,Badger,Snake,Lion", delimiter: ",")
print(pieces)
// > ["Dog", "Cat", "Badger", "Snake", "Lion"]

/*: ### Challenge 5: Word reverser (Перевертыш слов) */
func reversedByWord(sentence: String) -> String {
  var reversedWords = ""
  var lastWordIndex = sentence.startIndex

  for i in sentence.indices {
    if sentence[i] == " " {
      let substring = sentence[lastWordIndex..<i]
      reversedWords += substring.reversed() + " "
      lastWordIndex = sentence.index(after: i)
    }
  }

  // Add the final word
  let substring = sentence[lastWordIndex..<sentence.endIndex]
  reversedWords += substring.reversed()

  return reversedWords
}

let reversed = reversedByWord(sentence: "The quick brown fox jumps over the lazy dog")
print(reversed)
// > ehT kciuq nworb xof spmuj revo eht yzal god
