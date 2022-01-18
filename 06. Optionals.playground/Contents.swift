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

//authorName = nil
//print("Author is \(authorName!)")
// устраняем ошибку времени выполнения (the runtime error)
if authorName != nil {
  print("Author is \(authorName!)")
} else {
  print("No author.")
}


// Part 3. Optional binding (Необязательное связывание)
if let unwrappedAuthorName = authorName {
  print("Author is \(unwrappedAuthorName)")
} else {
  print("No author.")
}
// Author is Matt Galloway

if let authorName = authorName {
  print("Author is \(authorName)")
} else {
  print("No author.")
}

if let authorName = authorName,
   let authorAge = authorAge {
  print("The author is \(authorName) who is \(authorAge) years old.")
} else {
  print("No author or no age.")
}
// The author is Matt Galloway who is 30 years old.

if let authorName = authorName,
   let authorAge = authorAge,
   authorAge >= 40 {
  print("The author is \(authorName) who is \(authorAge) years old.")
} else {
  print("No author or no age or age less than 40.")
}
// No author or no age or age less than 40.

// UNWRAPPING. Mini-exercises
let myFavoriteSong: String? = "Беги за солнцем" // or nil

if let song = myFavoriteSong {
  print(song)
} else {
  print("I don’t have a favorite song.")
}
// Беги за солнцем

