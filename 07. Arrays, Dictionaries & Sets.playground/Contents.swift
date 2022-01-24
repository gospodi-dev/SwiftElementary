/*:## Arrays (Массивы)*/
/*:### Part 1. Creating arrays (Создание массивов)*/
/*
let evenNumbers = [2, 4, 6, 8]
// Вы можете создать пустой массив с помощью литерала пустого массива []
let subscribers: [String] = []
let allZeros = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
let vowels = ["A", "E", "I", "O", "U"]

/*: ### Part 2. Accessing elements (Доступ к элементам)*/
//: Using properties and methods (Использование свойств и методов)
var players = ["Alice", "Bob", "Cindy", "Dan"]
print(players.isEmpty)
// > false

if players.count < 2 {
    print("We need at least two players!") // Нам нужны как минимум два игрока!
} else {
    print("Let's start!")
}
// > Let's start!

var currentPlayer = players.first // "Alice"
print(currentPlayer as Any)
// > Optional("Alice")
print(players.last as Any)
// > Optional("Dan")
currentPlayer = players.min()
print(currentPlayer as Any)
// > Optional("Alice")
currentPlayer = players.max()
print(currentPlayer as Any)
// > Optional("Dan")

// Очевидно, что first и min() не всегда будут возвращать одно и то же значение.
print([2, 3, 1].first as Any)
// > Optional(2)

print([2, 3, 1].min() as Any)
// > Optional(1)

if let currentPlayer = currentPlayer {
    print("\(currentPlayer) will start")
}
// > Dan will start

//: Using subscripting (Использование индекса)

var firstPlayer = players[0]
print("First player is \(firstPlayer)")
// > First player is Alice

//var firstPlayer = players[4]
//print("First player is \(firstPlayer)") // > fatal error: Index out of range

// Using countable ranges to make an ArraySlice (Использование счетных диапазонов для создания ArraySlice)

let upcomingPlayersSlice = players[1...2]
print(upcomingPlayersSlice[1], upcomingPlayersSlice[2])
// > Bob Cindy

let upcomingPlayersArray = Array(players[1...2])
print(upcomingPlayersArray[0], upcomingPlayersArray[1])
// > Bob Cindy

// Checking for an element (Проверка наличия элемента)
func isEliminated(player: String) -> Bool {
    !player.contains(player)
}
print(isEliminated(player: "Bob"))
// > false

players[1...3].contains("Bob") // true

/*: ### Part 3. Modifying arrays (Модификация массивов)*/

//: Appending elements (Добавление элементов)
players.append("Eli")
players += ["Gina"]

print(players)
// ["Alice", "Bob", "Cindy", "Dan", "Eli", "Gina"]
//: Inserting elements (Вставка элементов)
players.insert("Frank", at: 5)
print(players)
// ["Alice", "Bob", "Cindy", "Dan", "Eli", "Frank", "Gina"]

//: Removing elements (Удаление элементов)
var removedPlayer = players.removeLast()
print("\(removedPlayer) was removed")
// > Gina was removed

removedPlayer = players.remove(at: 2)
print("\(removedPlayer) was removed")
// > Cindy was removed

//: Mini-exercise (Мини-упражнение)
var players = ["Alice", "Bob", "Dan", "Eli", "Frank"]
print(players.firstIndex(of: "Dan")!)
// > 2

//: Updating elements (Обновление элементов)
print(players)
// > ["Alice", "Bob", "Dan", "Eli", "Frank"]
players[4] = "Franklin"
print(players)
// > ["Alice", "Bob", "Dan", "Eli", "Franklin"]
players[0...1] = ["Donna", "Craig", "Brian", "Anna"]
print(players)
// > ["Donna", "Craig", "Brian", "Anna", "Dan", "Eli", "Franklin"]

//: Moving elements (Движущиеся элементы)
let playerAnna = players.remove(at: 3)
players.insert(playerAnna, at: 0)
print(players)
// ["Anna", "Donna", "Craig", "Brian", "Dan", "Eli", "Franklin"]

players.swapAt(1, 3)
print(players)
// > ["Anna", "Brian", "Craig", "Donna", "Dan", "Eli", "Franklin"]

players.sort()
print(players)
// > ["Anna", "Brian", "Craig", "Dan", "Donna", "Eli", "Franklin"]

/*: ### Part 4. Iterating through an array (Итерации по массиву)*/
// let scores = [2, 2, 8, 6, 1, 2, 1]
for player in players {
    print(player)
}
// > Anna
// > Brian
// > Craig
// > Dan
// > Donna
// > Eli
// > Franklin

for (index, player) in players.enumerated() {
    print("\(index + 1). \(player)")
}
// > 1. Anna
// > 2. Brian
// > 3. Craig
// > 4. Dan
// > 5. Donna
// > 6. Eli
// > 7. Franklin

//func sumOfElements(in array: [Int]) -> Int {
//    var sum = 0
//    for number in array {
//        sum += number
//    }
//    return sum
//}
//print(sumOfElements(in: scores))
//// 22

//: Mini-exercise
players = ["Anna", "Brian", "Craig", "Dan", "Donna", "Eli", "Franklin"]
let scores = [2, 2, 8, 6, 1, 2, 1]

for (index, player) in players.enumerated() {
  print("\(index + 1). \(player) - \(scores[index])")
}
// > 1. Anna - 2
// > 2. Brian - 2
// > 3. Craig - 8
// > 4. Dan - 6
// > 5. Donna - 1
// > 6. Eli - 2
// > 7. Franklin - 1

//: Running time for array operations (Время выполнения операций с массивом)

/*: ## Dictionaries (Словари)
 '''
Словарь - это неупорядоченный набор пар, каждая из которых состоит из **ключа** и **значения**
 ''' */
/*: ### Part 1. Creating dictionaries (Создание словарей)*/
var namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
print(namesAndScores)
// > ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
// Литерал пустого словаря:
namesAndScores = [:]
print(namesAndScores)
// > [:]
// Можно создать новый пустой словарь, где ключи - строки, а значения - целые числа
var pairs: [String: Int] = [:]
print(pairs)
// > [:]
pairs.reserveCapacity(20)
/*: ### Part 2. Accessing values (Доступ к значениям)*/
//: Using subscripting (Использование подзаписи)
namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
print(namesAndScores["Anna"]!) // возвращаемый тип является необязательным (an optional)
// > 2
//: Using properties and methods (Использование свойств и методов)
namesAndScores.isEmpty // false
namesAndScores.count // 4
/*: ### Part 3. Modifying dictionaries (Изменение словарей)*/
//: Adding pairs (Добавление пар)
var bobData = [
  "name": "Bob",
  "profession": "Card Player",
  "country": "USA"
]
bobData.updateValue("CA", forKey: "state")
bobData["city"] = "San Francisco"
//: Mini-exercise. Мини-упражнение
// Напишите функцию, которая печатает город и штат данного игрока.
var bob = ["name": "Bob",
           "profession": "Card Player",
           "country": "Russia",
           "state": "RU",
           "city": "Saint-Petersburg"]

func printLocation(ofPlayer player: [String: String]) {
  if let state = player["state"], let city = player["city"] {
    print("Player lives in \(city), \(state)")
  }
}

printLocation(ofPlayer: bob)
//: Updating values (Обновление значений)
bobData.updateValue("Bobby", forKey: "name") // Bob
bobData["profession"] = "Mailman"
//: Removing pairs (Удаление пар)
bobData.removeValue(forKey: "state")
bobData["city"] = nil
/*: ### Part 4. Iterating through dictionaries (Итерация по словарям)*/
for (player, score) in namesAndScores {
  print("\(player) - \(score)")
}
// > Anna - 2
// > Brian - 2
// > Craig - 8
// > Donna - 6
// Также можно перебирать только ключи
for player in namesAndScores.keys {
  print("\(player), ", terminator: "") // no newline
}
print("") // print one final newline
// > Craig, Donna, Brian, Anna,
/*: ### Part 5. Running time for dictionary operations (Время выполнения словарных операций)*/


/*: ## Sets (Множества)
 '''
 Множество - это неупорядоченная коллекция уникальных значений одного типа. Это может быть очень полезно, когда вы хотите, чтобы элемент не появлялся в коллекции более одного раза и когда порядок элементов не важен.
 '''
*/
//: Creating sets (Создание множеств)
let setOne: Set<Int> = [1]
//: Set literals (Литералы множества)
let someArray = [1, 2, 3, 1]
var explicitSet: Set<Int> = [1, 2, 3, 1]
var someSet = Set([1, 2, 3, 1])
print(someSet)
// > [2, 3, 1] но порядок не определен
//: Accessing elements (Доступ к элементам)
print(someSet.contains(1))
// > true
print(someSet.contains(4))
// > false
//: Adding and removing elements (Добавление и удаление элементов)
someSet.insert(5)
let removedElement = someSet.remove(1)
print(removedElement!)
// > 1
*/
/*: ## Challenges */
/*: ### Challenge 1: Which is valid (Задача 1: Что является действительным) */
let array1 = [Int]() // Valid
//let array2 = [] // Invalid: the type cannot be inferred (Неверно: тип не может быть определен)
let array3: [String] = [] // Valid

let array4 = [1, 2, 3] // [1, 2, 3]
print(array4[0]) // 1 - Valid
// print(array4[5]) // Fatal error: Index out of range (Фатальная ошибка: Индекс вне диапазона)
array4[1...2] // [2, 3] - Valid
// array4[0] = 4 // error: cannot assign through subscript: 'array4' is a 'let' constant array4[0] = 4
// array4.append(4) // error: cannot use mutating member on immutable value: 'array4' is a 'let' constant

var array5 = [1, 2, 3] // [1, 2, 3]

array5[0] = array5[1] // 2
print(array5) // [2, 2, 3]
array5[0...1] = [4, 5] // [4, 5]
print(array5) // [4, 5, 3]
// array5[0] = "Six" // error: cannot assign value of type 'String' to subscript of type 'Int' array5[0] = "Six" (ошибка: невозможно присвоить значение типа 'String' подскрипту типа 'Int')
// array5 += 6 // error: cannot convert value of type 'Int' to expected argument type 'Array<Int>' (ошибка: невозможно преобразовать значение типа 'Int' в ожидаемый тип аргумента 'Array<Int>'). Invalid: the += operator requires an array on the right-hand side, not a single element (Неверно: оператор += требует массив в правой части, а не один элемент)
for item in array5 { print(item)}
//4
//5
//3
/*: ### Challenge 2: Remove the first number (Задача 2: Удалите первую цифру) */
func removingOnce(_ item: Int, from array: [Int]) -> [Int] {
  var result = array
  if let index = array.firstIndex(of: item) {
    result.remove(at: index)
  }
  return result
}
/*: ### Challenge 3: Remove the numbers (Задача 3: Удалите цифры) */
func removing(_ item: Int, from array: [Int]) -> [Int] {
    var newArray: [Int] = []
    for candidateItem in array {
        if candidateItem != item {
            newArray.append(candidateItem)
        }
    }
    return newArray
}
/*: ### Challenge 4: Reverse an array (Задача 4: Перевернуть массив) */
func reversed(_ array: [Int]) -> [Int] {
    var newArray: [Int] = []
    for item in array {
        newArray.insert(item, at: 0)
    }
    return newArray
}
/*: ### Challenge 5: Return the middle (Задача 5: Верните середину) */
func middle(_ array: [Int]) -> Int? {
    guard !array.isEmpty else {
        return nil
    }
    return array[(array.count-1)/2]
}
/*: ### Challenge 6: Find the minimum and maximum (Задача 6: Найдите минимум и максимум) */
func minMax(of numbers: [Int]) -> (min: Int, max: Int)? {
    if numbers.isEmpty {
        return nil
    }
    
    var min = numbers[0]
    var max = numbers[0]
    for number in numbers {
        if number < min {
            min = number
        }
        if number > max {
            max = number
        }
    }
    return (min, max)
}
/*: ### Challenge 7: Which is valid (Задача 7: Что является действительным) */
// let dict1: [Int, Int] = [:] // Invalid: type should be [Int: Int] not [Int, Int]
// let dict2 = [:] // error: empty collection literal requires an explicit type (пустой литерал коллекции требует явного типа). Invalid: type cannot be inferred (Неверно: тип не может быть определен)
let dict3: [Int: Int] = [:] // Valid

let dict4 = ["One": 1, "Two": 2, "Three": 3]
// dict4[1] // error: no exact matches in call to subscript. Invalid: key should be String, not Int (ошибка: нет точных совпадений в обращении к субскрипту. Неверно: ключ должен быть String, а не Int)
dict4["One"] // 1
// dict4["Zero"] = 0 // error: cannot assign through subscript: 'dict4' is a 'let' constant. Invalid: dict4 is a constant
// dict4[0] = "Zero" // error: no exact matches in call to subscript. Invalid: key should be a String and value should be an Int - and dict4 is a constant (ошибка: нет точных совпадений в вызове subscript. Неверно: ключ должен быть String, а значение должно быть Int - и dict4 является константой)

var dict5 = ["NY": "New York", "CA": "California"]
dict5["NY"] // "New York"
print(dict5) // ["NY": "New York", "CA": "California"]
dict5["WA"] = "Washington" // "Washington"
print(dict5) // ["CA": "California", "WA": "Washington", "NY": "New York"]
dict5["CA"] = nil // nil
print(dict5) // ["WA": "Washington", "NY": "New York"]

/*: ### Challenge 8: Long names (Задача 8: Длинные имена) */
func printLongStateNames(in dictionary: [String: String]) {
  for (_, value) in dictionary {
    if value.count > 8 {
      print(value)
    }
  }
}

/*: ### Challenge 9: Merge dictionaries (Задача 9: объединить словари) */
func merging(_ dict1: [String: String], with dict2: [String: String]) -> [String: String] {
    var newDictionary = dict1
    for (key, value) in dict2 {
        newDictionary[key] = value
    }
    return newDictionary
}

/*: ### Challenge 10: Count the characters (Задание 10: Подсчитайте символы) */
func occurrencesOfCharacters(in text: String) -> [Character: Int] {
  var occurrences: [Character: Int] = [:]
  for character in text {
    if let count = occurrences[character] {
      occurrences[character] = count + 1
    } else {
      occurrences[character] = 1
    }
  }
  return occurrences
}
// Другой способ
func occurrencesOfCharactersBonus(in text: String) -> [Character: Int] {
  var occurrences: [Character: Int] = [:]
  for character in text {
    occurrences[character, default: 0] += 1
  }
  return occurrences
}

/*: ### Challenge 11: Unique values (Задача 11: уникальные ценности)*/
func isInvertible(_ dictionary: [String: Int]) -> Bool {
  var seenValues: Set<Int> = []
  for value in dictionary.values {
    if seenValues.contains(value) {
      return false  // duplicate value detected
    }
    seenValues.insert(value)
  }
  return true
}

