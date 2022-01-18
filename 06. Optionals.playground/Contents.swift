import UIKit
/*
// Part 1. Introducing nil and optionals (Представляем nil и опциональные возможности)
var name = "Matt Galloway"
var age = 30
var occupation = "Software Developer & Author"

var errorCode: Int?
errorCode = 100
errorCode = nil

// OPTIONALS INTRODUCTION. Mini-exercises
// 1
let myFavoriteSong: String? = "Беги за солнцем" // or nil
// 2
let parsedInt = Int("10") // возвращает необязательное значение, поскольку строка может не быть целым числом, в этом случае результатом будет nil
let anotherParsedInt = Int("dog") // nil

// Part 2. Unwrapping optionals (Развертывание опций)
var result: Int? = 30
print(result) // Optional(30)
print(result + 1)
*/
var authorName: String? = "Matt Galloway"
var authorAge: Int? = 30
// принудительное разворачивание (force unwrapping)
var unwrappedAuthorName = authorName!
print("Author is \(unwrappedAuthorName)")
// Author is Matt Galloway

authorName = nil
print("Author is \(authorName!)")
// устраняем ошибку времени выполнения (the runtime error)
if authorName != nil {
  print("Author is \(authorName!)")
} else {
  print("No author.")
}
