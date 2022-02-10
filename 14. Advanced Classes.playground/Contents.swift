/*: # Глава 14. Advanced Classes (Продвинутые классы) */
/*: ## Part 01. Introducing inheritance (Знакомство с наследованием) */

//struct Grade {
//    var letter: Character
//    var points: Double
//    var credits: Double
//}

//class Person {
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//}
/*
 // 1
 //class Student {
 //  var firstName: String
 //  var lastName: String
 //  var grades: [Grade] = []
 //
 //  init(firstName: String, lastName: String) {
 //    self.firstName = firstName
 //    self.lastName = lastName
 //  }
 //
 //  func recordGrade(_ grade: Grade) {
 //    grades.append(grade)
 //  }
 
 // 2
 class Student: Person {
 var grades: [Grade] = []
 
 func recordGrade(_ grade: Grade) {
 grades.append(grade)
 }
 }
 
 let john = Person(firstName: "Johnny", lastName: "Appleseed")
 let jane = Student(firstName: "Jane", lastName: "Appleseed")
 
 john.firstName // "John"
 jane.firstName // "Jane"
 
 let history = Grade(letter: "B", points: 9.0, credits: 3.0)
 jane.recordGrade(history) // Student
 // john.recordGrade(history) // john is not a student!
 
 class BandMember: Student {
 var minimumPracticeTime = 2
 }
 
 class OboePlayer: BandMember {
 // This is an example of an override, which we’ll cover soon (Это пример переопределения, который мы рассмотрим в ближайшее время).
 override var minimumPracticeTime: Int {
 get {
 super.minimumPracticeTime * 2
 }
 set {
 super.minimumPracticeTime = newValue / 2
 }
 }
 }
 
 /*: ## Part 02. Polymorphism (Полиморфизм) */
 // полиморфизм - это способность языка программирования по-разному относиться к объекту в зависимости от контекста
 
 func phonebookName(_ person: Person) -> String {
 "\(person.lastName), \(person.firstName)"
 }
 
 let person = Person(firstName: "Johnny", lastName: "Appleseed")
 let oboePlayer = OboePlayer(firstName: "Jane",
 lastName: "Appleseed")
 
 phonebookName(person) // Appleseed, Johnny
 phonebookName(oboePlayer) // Appleseed, Jane
 
 /*: ## Part 03. Runtime hierarchy checks (Проверка иерархии во время выполнения) */
 
 var hallMonitor = Student(firstName: "Jill",
 lastName: "Bananapeel")
 hallMonitor = oboePlayer
 
 //oboePlayer as Student
 //(oboePlayer as Student).minimumPracticeTime // ERROR: No longer a band member!
 
 hallMonitor as? BandMember
 (hallMonitor as? BandMember)?.minimumPracticeTime // 4 (optional)
 
 hallMonitor as! BandMember // Careful! Failure would lead to a runtime crash.
 (hallMonitor as! BandMember).minimumPracticeTime // 4 (force unwrapped)
 
 //if let hallMonitor = hallMonitor as? BandMember {
 //  print("This hall monitor is a band member and practices
 //         at least \(hallMonitor.minimumPracticeTime)
 //         hours per week.")
 //}
 
 
 func afterClassActivity(for student: Student) -> String {
 "Goes home!"
 }
 
 func afterClassActivity(for student: BandMember) -> String {
 "Goes to practice!"
 }
 
 
 afterClassActivity(for: oboePlayer) // Goes to practice!
 afterClassActivity(for: oboePlayer as Student) // Goes home!
 
 /*: ## Part 04. Inheritance, methods and overrides (Наследование, методы и переопределения) */
 
 class StudentAthlete: Student {
 var failedClasses: [Grade] = []
 
 override func recordGrade(_ grade: Grade) {
 super.recordGrade(grade)
 
 if grade.letter == "F" {
 failedClasses.append(grade)
 }
 }
 
 var isEligible: Bool {
 failedClasses.count < 3
 }
 }
 
 //: Introducing super (Представляем супер)
 
 //override func recordGrade(_ grade: Grade) {
 //  var newFailedClasses: [Grade] = []
 //  for grade in grades {
 //    if grade.letter == "F" {
 //      newFailedClasses.append(grade)
 //    }
 //  }
 //  failedClasses = newFailedClasses
 //
 //  super.recordGrade(grade)
 //}
 
 //: Preventing inheritance (Предотвращение наследования)
 // 1
 final class FinalStudent: Person {}
 class FinalStudentAthlete: FinalStudent {} // Build error!
 
 // 2
 class AnotherStudent: Person {
 final func recordGrade(_ grade: Grade) {}
 }
 
 class AnotherStudentAthlete: AnotherStudent {
 override func recordGrade(_ grade: Grade) {} // Build error!
 }
 
 /*: ## Part 05. Inheritance and class initialization (Наследование и инициализация классов) */
 // 1
 //class StudentAthlete: Student {
 //  var sports: [String]
 //  // original code
 //}
 
 // 2
 //class StudentAthlete: Student {
 //  var sports: [String]
 //
 //  init(sports: [String]) {
 //    self.sports = sports
 //    // Build error - super.init isn’t called before
 //    // returning from initializer
 //  }
 //  // original code
 //}
 
 // 3
 class StudentAthlete: Student {
 var sports: [String]
 
 init(firstName: String, lastName: String, sports: [String]) {
 self.sports = sports
 super.init(firstName: firstName, lastName: lastName)
 }
 // original code
 }
 
 /*: ## Part 06. Two-phase initialization (Двухфазная инициализация) */
 
 class StudentAthlete: Student {
 var sports: [String]
 
 init(firstName: String, lastName: String, sports: [String]) {
 // 1
 self.sports = sports
 // 2
 let passGrade = Grade(letter: "P", points: 0.0,
 credits: 0.0)
 // 3
 super.init(firstName: firstName, lastName: lastName)
 // 4
 recordGrade(passGrade)
 }
 // original code
 }

/*: ## Part 07. Required and convenience initializers (Необходимые и удобные инициализаторы) */

// 1
//class Student {
//  let firstName: String
//  let lastName: String
//  var grades: [Grade] = []
//
//  init(firstName: String, lastName: String) {
//    self.firstName = firstName
//    self.lastName = lastName
//  }
//
//  init(transfer: Student) {
//    self.firstName = transfer.firstName
//    self.lastName = transfer.lastName
//  }
//
//  func recordGrade(_ grade: Grade) {
//    grades.append(grade)
//  }
//}

//: **требуемые инициализаторы** (***required initializers***)
// 2
class Student {
    let firstName: String
    let lastName: String
    var grades: [Grade] = []
    
    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    init(transfer: Student) {
        self.firstName = transfer.firstName
        self.lastName = transfer.lastName
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

class StudentAthlete: Student {
  // Now required by the compiler!
  required init(firstName: String, lastName: String) {
    self.sports = []
    super.init(firstName: firstName, lastName: lastName)
  }
  // original code
}

//: **удобный инициализатор** (*a **convenience** initializer*)

class Student {
  convenience init(transfer: Student) {
    self.init(firstName: transfer.firstName,
              lastName: transfer.lastName)
  }
  // original code
}



/*: ## Part 08. When and why to subclass (Когда и зачем создавать подклассы) */
class Student: Person {
  var grades: [Grade]
  var sports: [Sport]
  // original code
}

class Team {
  var players: [StudentAthlete] = []

  var isEligible: Bool {
    for player in players {
      if !player.isEligible {
        return false
      }
    }
    return true
  }
}
/*: ## Part 08. Shared base classes (Общие базовые классы) */

// A button that can be pressed.
class Button {
  func press() {}
}

// An image that can be rendered on a button
class Image {}

// A button that is composed entirely of an image.
class ImageButton: Button {
  var image: Image

  init(image: Image) {
    self.image = image
  }
}

// A button that renders as text.
class TextButton: Button {
  var text: String

  init(text: String) {
    self.text = text
  }
}

/*: ## Part 09. ## Understanding the class lifecycle (Понимание жизненного цикла класса) */

var someone = Person(firstName: "Johnny", lastName: "Appleseed")
// Person object has a reference count of 1 (someone variable) - Объект Person имеет количество ссылок, равное 1 (переменная someone)

var anotherSomeone: Person? = someone
// Reference count 2 (someone, anotherSomeone) - Количество ссылок 2

var lotsOfPeople = [someone, someone, anotherSomeone, someone]
// Reference count 6 (someone, anotherSomeone, 4 references in lotsOfPeople)

anotherSomeone = nil
// Reference count 5 (someone, 4 references in lotsOfPeople)

lotsOfPeople = []
// Reference count 1 (someone)


someone = Person(firstName: "Johnny", lastName: "Appleseed")
// Reference count 0 for the original Person object!
// Variable someone now references a new object

// Количество ссылок 0 для исходного объекта Person!
// Переменная someone теперь ссылается на новый объект


//: ### Deinitialization (Деинициализация)

class Person {
  // original code
  deinit {
    print("\(firstName) \(lastName) is being removed
          from memory!")
  }
}

 */


/*: ### Mini-exercises (Мини-упражнения) */

// Модифицируйте класс `Student`, чтобы иметь возможность записывать имя студента в список выпускников. Добавьте имя студента в список при деаллокации объекта.

struct Grade {
  var letter: Character
  var points: Double
  var credits: Double
}

class Student {
  let firstName: String
  let lastName: String
  var grades: [Grade] = []
  
  required init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  convenience init(transfer: Student) {
    self.init(firstName: transfer.firstName, lastName: transfer.lastName)
  }
  
  func recordGrade(_ grade: Grade) {
    grades.append(grade)
  }
  
  static var graduates: [String] = []
  
  deinit {
    Student.graduates.append("\(lastName), \(firstName)")
  }
}

/*: ## Part 10. ## Retain cycles and weak references (Циклы сохранения и слабые ссылки) */

class Student: Person {
  var partner: Student?
  // original code
  deinit {
    print("\(firstName) is being deallocated!")
  }
}

var alice: Student? = Student(firstName: "Alice",
                              lastName: "Appleseed")
var bob: Student? = Student(firstName: "Bob",
                            lastName: "Appleseed")

alice?.partner = bob
bob?.partner = alice


alice = nil
bob = nil

//: the reference weak
class Student: Person {
  weak var partner: Student?
  // original code
}

