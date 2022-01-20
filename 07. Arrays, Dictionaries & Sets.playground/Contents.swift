import UIKit
/*
// Part 1. Arrays (Массивы). Creating arrays (Создание массивов)

//Creating arrays (Создание массивов)
let evenNumbers = [2, 4, 6, 8]
// Вы можете создать пустой массив с помощью литерала пустого массива []
let subscribers: [String] = []
let allZeros = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
let vowels = ["A", "E", "I", "O", "U"]

// Part 2. Accessing elements (Доступ к элементам)

// Using properties and methods (Использование свойств и методов)
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

// Using subscripting (Использование индекса)

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

// Part 3. Modifying arrays (Модификация массивов)

// Appending elements (Добавление элементов)
players.append("Eli")
players += ["Gina"]

print(players)
// ["Alice", "Bob", "Cindy", "Dan", "Eli", "Gina"]
 #fileLiteral(resourceName: "03. Basic Control Flow.playground")
// Inserting elements (Вставка элементов)
players.insert("Frank", at: 5)
print(players)
// ["Alice", "Bob", "Cindy", "Dan", "Eli", "Frank", "Gina"]

// Removing elements (Удаление элементов)
var removedPlayer = players.removeLast()
print("\(removedPlayer) was removed")
// > Gina was removed

removedPlayer = players.remove(at: 2)
print("\(removedPlayer) was removed")
// > Cindy was removed
*/
// Mini-exercise (Мини-упражнение)
var players = ["Alice", "Bob", "Dan", "Eli", "Frank"]
print(players.firstIndex(of: "Dan")!)
// > 2

// Updating elements (Обновление элементов)
print(players)
// > ["Alice", "Bob", "Dan", "Eli", "Frank"]
players[4] = "Franklin"
print(players)
// > ["Alice", "Bob", "Dan", "Eli", "Franklin"]
players[0...1] = ["Donna", "Craig", "Brian", "Anna"]
print(players)
// > ["Donna", "Craig", "Brian", "Anna", "Dan", "Eli", "Franklin"]

// Moving elements (Движущиеся элементы)
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
