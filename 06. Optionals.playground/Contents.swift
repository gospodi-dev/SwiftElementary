import UIKit

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
