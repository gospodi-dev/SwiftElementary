/*
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}


let temperatureInFahrenheit = 25
var result = 5
if temperatureInFahrenheit <= 20 {
    result = result + 6
} else if temperatureInFahrenheit >= 30 {
    result = result + 7
} else {
    result = result + 8
}

let base = 1
let power = 3
var answer = 1
for _ in 1...power {
    answer *= base
}
print(answer)


var i = 2
while i < 3 {
i += 1
}
print(i)

let a = true
let b = true
let c = false
if a && c {
print ("a")
} else {
    if a || c {
        print ("c")
    } else {
        print ("b")
    }
}


let a = "Hello World!"
let b = "Hello World!"
if a == b {
    print("These two strings are considered equal")
}


func customFunc(value: Int) -> Int {
    return value * 5
}
let a = customFunc(value: 10)
print(a)


// 10
let a = 10
let b = 4
let c = 9
let d = 3
let e = (a - b) * c / d
let f = e % 5
print(f)


// 11
let a = 2
let b = 1
let string = "string1"
if a > b {
    if string == "string" {
        print("a")
    } else {
        print("b")
    }
} else {
    print("c")
}

 // 12

var a = 0
for i in 1...5 {
if i > 2 {
break
}
a += 1
}
print(a)


// 13
var a = 1
a += 2
print(a)

// 14
var a: Int? = nil
let b = a ?? 5
 

// 15
struct MyStruct {
    static var helloWorld = "HelloWorld"var name: String
    var age: Int
}
let a = MyStruct(name: "James", age: 25)
print(a.helloWorld)


// 16
func sendToServer(name: String?, address: String?, phone: String?) {
    guard let name = name else {
        print("No name to submit")
        return
    }
    guard let address = address else {
        print("No address to submit")
        return
    }
    guard let phone = phone else {
        print("No phone to submit")
        return
    }
}
sendToServer(name: nil, address: "13", phone: "fg")



// 17
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}


// 18
func someFunction(a: Bool) -> (Int) -> Int {
    func someFunction1(a: Int) -> Int { return a + 1 }
    func someFunction2(a: Int) -> Int { return a - 1 }
    return a ? someFunction1 : someFunction2
}
let function = someFunction(a: true)
let a = function(3)
print(a)


// 19

let numbers = [1, 2, 3].flatMap { [$О, $О] }
print(numbers)

 

// 20
var foo: Float = 32
var bar: Double = 32
print(foo)
print(bar)


// 21
enum MyError: Error {
    case broken
    case busted
    case badgered
}
func willThrowAnError() throws {
    throw MyError.busted
}
do {
    try willThrowAnError()
} catch MyError.busted {
    print("Code was busted!")
} catch {
    print("Code just didn't work")
}

// 24
let names: [String?] = ["Barbara", nil, "Janet", nil, "Peter", nil,
"George"]
if let firstName = names.first {
    print(firstName)
}


11011*101
h(i) = (11 * i2) mod 10
*/
