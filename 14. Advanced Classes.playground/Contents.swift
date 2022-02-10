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
 */
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



