/*: ## 11. Properties (Свойства) */
/*: ### Part 01. Stored properties (Хранимые свойства) */

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
