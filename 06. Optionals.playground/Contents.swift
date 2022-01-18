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

// Part 4. Introducing guard (Введение guard)
func guardMyCastle(name: String?) {
    guard let castleName = name else {
        print("No castle!")
        return
    }
    // At this point, `castleName` is a non-optional String (На данном этапе `castleName` является неопциональной строкой.)
    print("Your castle called \(castleName) was guarded!")
}

func calculateNumberOfSides(shape: String) -> Int? {
  switch shape {
  case "Triangle":
    return 3
  case "Square":
    return 4
  case "Rectangle":
    return 4
  case "Pentagon":
    return 5
  case "Hexagon":
    return 6
  default:
    return nil
  }
}

func maybePrintSides(shape: String) {
  let sides = calculateNumberOfSides(shape: shape)

  if let sides = sides {
    print("A \(shape) has \(sides) sides.")
  } else {
    print("I don’t know the number of sides for \(shape).")
  }
}
// ту же логику можно записать с таким выражением защиты
func maybePrintSides(shape: String) {
  guard let sides = calculateNumberOfSides(shape: shape) else {
    print("I don’t know the number of sides for \(shape).")
    return
  }
    
    print("A \(shape) has \(sides) sides.")
}
*/
// Part 5. Nil coalescing (Коалесценция нулей)

var optionalInt: Int? = 10
var mustHaveResult = optionalInt ?? 0
// Предыдущий код эквивалентен следующему:
var optionalInt: Int? = 10
var mustHaveResult: Int
if let unwrapped = optionalInt {
  mustHaveResult = unwrapped
} else {
  mustHaveResult = 0
}

