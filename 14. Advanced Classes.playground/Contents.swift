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


