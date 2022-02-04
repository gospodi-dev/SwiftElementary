/*: ## 11. Properties (Свойства) */
/*: ### Part 01. Stored properties (Хранимые свойства) */
/*
struct Contact {
    var fullName: String
    var emailAddress: String
}

var person = Contact(fullName: "Grace Murray",
                 emailAddress: "grace@navy.mil")

person.fullName // "Grace Murray"
person.emailAddress // "grace@navy.mil"

person.fullName = "Grace Hopper"
person.fullName // Grace Hopper

struct Contact {
  var fullName: String
  let emailAddress: String
}

person.emailAddress = "grace@gmail.com"
// Error: cannot assign to a constant. error: type of expression is ambiguous without more context (Ошибка: невозможно присвоить константу. ошибка: тип выражения неоднозначен без дополнительного контекста)


/*: ### Part 02. Default values (Значения по умолчанию) */
struct Contact {
  var fullName: String
  let emailAddress: String
  var relationship = "Friend"
}
var person = Contact(fullName: "Grace Murran",
                     emailAddress: "grace@navy.mil")
person.relationship // Friend

var boss = Contact(fullName: "Serg Lackrua",
                   emailAddress: "serg@lackrua.com",
                   relationship: "Boss")
person.relationship // Friend
boss.relationship // Boss

/*: ### Part 03. Computed properties (Вычисляемые свойства) */
struct TV {
  var height: Double
  var width: Double
  
  // 1
  var diagonal: Int {
    // 2
    let result = (height * height +
      width * width).squareRoot().rounded() // 110
    // 3
    return Int(result) // 110
  }
}

var tv = TV(height: 53.93, width: 95.87)
tv.diagonal // 110

tv.width = tv.height
tv.diagonal // 76


/*: ### Properties Mini-exercise, TV */
struct TV {
  var height: Double
  var width: Double
  
  var diagonal: Int {
    let result = (height * height + width * width).squareRoot().rounded()
    return Int(result)
  }
}

let tv = TV(height: 15.7, width: 28)
tv.diagonal // 32


/*: ### Part 04. Computed properties (Вычисляемые свойства) */
var diagonal: Int {
  // 1
  get {
    // 2
    let result = (height * height +
      width * width).squareRoot().rounded()
    return Int(result)
  }
  set {
    // 3
    let ratioWidth = 16.0
    let ratioHeight = 9.0
    // 4
    let ratioDiagonal = (ratioWidth * ratioWidth +
      ratioHeight * ratioHeight).squareRoot()
    height = Double(newValue) * ratioHeight / ratioDiagonal
    width = height * ratioWidth / ratioHeight
  }
}

tv.diagonal = 70
tv.height // 34.32...
tv.width // 61.01...
 */
/*: ### Part 05. Type properties (Свойства типов) */
/*
struct Level {
  let id: Int
  var boss: String
  var unlocked: Bool
}

let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)
*/

struct Level {
  static var highestLevel = 1
  let id: Int
  var boss: String
  var unlocked: Bool
}
/*
// Error: you can’t access a type property on an instance (вы не можете получить доступ к свойству типа на экземпляре)
let highestLevel = level3.highestLevel
*/

Level.highestLevel // 1
