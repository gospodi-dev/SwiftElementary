/*: # Глава 14. Advanced Classes (Продвинутые классы) */
/*: ## Part 01. Introducing inheritance (Знакомство с наследованием) */
struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

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

