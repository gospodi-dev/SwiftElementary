/*: # Глава 18. Access Control, Code Organization & Testing (Контроль доступа, организация кода и тестирование) */
/*: ## Part 01. Problems introduced by lack of access control (Проблемы, возникающие из-за отсутствия контроля доступа) */
import Foundation
/// A protocol describing core functionality for an account

/*
// Создайте новую учетную запись
let account = BasicAccount()

// Вносить и снимать деньги
account.deposit(amount: 10.00)
account.withdraw(amount: 5.00)

// ... или творить зло!
// account.balance = 1000000.00 // error: cannot assign to property: 'balance' setter is inaccessible (ошибка: невозможно присвоить свойству: сеттер 'balance' недоступен)


/*: ## Part 02. Introducing access control (Введение контроля доступа) */
//: Private

func writeCheck(amount: Dollars) -> Check? {
  guard balance > amount else {
    return nil
  }

  let check = Check(amount: amount, from: self)
  withdraw(amount: check.amount)
  return check
}

func deposit(_ check: Check) {
  guard !check.cashed else {
    return
  }

  deposit(amount: check.amount)
  check.cash()
}

// Create a checking account for John. Deposit $300.00
let johnChecking = CheckingAccount()
johnChecking.deposit(amount: 300.00)

// Write a check for $200.00
let check = johnChecking.writeCheck(amount: 200.0)!

// Create a checking account for Jane, and deposit the check.
let janeChecking = CheckingAccount()
janeChecking.deposit(check)
janeChecking.balance // 200.00

// Try to cash the check again. Of course, it had no effect on
// Jane’s balance this time :]
janeChecking.deposit(check)
janeChecking.balance // 200.00

/*: ## Part 03. Testing (Тестирование)*/

import XCTest

// Create a new account
let account = BasicAccount()

// Deposit and withdraw some money
account.deposit(amount: 10.00)
account.withdraw(amount: 5.00)

// ... or do evil things!
//account.balance = 1000000.00

// Create a checking account for John. Deposit $300.00
let johnChecking = CheckingAccount()
johnChecking.deposit(amount: 300.00)

// Write a check for $200.00
let check = johnChecking.writeCheck(amount: 200.0)!

// Create a checking account for Jane, and deposit the check.
let janeChecking = CheckingAccount()
janeChecking.deposit(check)
janeChecking.balance // 200.00

// Try to cash the check again. Of course, it had no effect on
// Jane's balance this time
janeChecking.deposit(check)
janeChecking.balance // 200.00

class SavingsAccount: BasicAccount {
  var interestRate: Double
  private let pin: Int
  
  @available(*, deprecated, message: "Use init(interestRate:pin:) instead")
  init(interestRate: Double) {
    self.interestRate = interestRate
    pin = 0;
  }
  
  init(interestRate: Double, pin: Int) {
    self.interestRate = interestRate
    self.pin = pin
  }
  
  @available(*, deprecated, message: "Use processInterest(pin:) instead")
  func processInterest() {
    let interest = balance * interestRate
    deposit(amount: interest)
  }
  
  func processInterest(pin: Int) {
    if pin == self.pin {
      let interest = balance * interestRate
      deposit(amount: interest)
    }
  }
}

func createAccount() -> some Account {
  CheckingAccount()
}

class BankingTests: XCTestCase {

  var checkingAccount: CheckingAccount!
  
  override func setUp() {
    super.setUp()
    checkingAccount = CheckingAccount()
  }

  override func tearDown() {
    checkingAccount.withdraw(amount: checkingAccount.balance)
    super.tearDown()
  }

  func testNewAccountBalanceZero() {
    let checkingAccount = CheckingAccount()
    XCTAssertEqual(checkingAccount.balance, 0)
  }

  func testCheckOverBudgetFails() {
    let checkingAccount = CheckingAccount()
    let check = checkingAccount.writeCheck(amount: 100)
    XCTAssertNil(check)
  }

  func testNewAPI() {
    guard #available(iOS 15, *) else {
      XCTFail("Only available in iOS 15 and above")
      return
    }
    // perform test
  }
}

BankingTests.defaultTestSuite.run()
*/
/*: ## Challenge 1. Singleton pattern */

class Logger {
  
  // Приватный инициализатор необходим для ограничения инстанцирования, чтобы только сам класс мог создавать объекты..
  private init() {}
  
  // Единый, общий экземпляр.
  static let sharedInstance = Logger()
  
  func log(_ text: String) {
    print(text)
  }
}

Logger.sharedInstance.log("Hello, Swift!")

//Logger().log("Can't do this :)") // Can't be instantiated outside of `Logger`

/*: ## Challenge 2. Stack */
struct Stack<Element> {
  
  private var elements: [Element] = []
  
  var count: Int {
    elements.count
  }
  
  func peek() -> Element? {
    elements.last
  }
  
  mutating func push(_ element: Element) {
    elements.append(element)
  }
  
  mutating func pop() -> Element? {
    if elements.isEmpty {
      return nil
    }
    return elements.removeLast()
  }
}

var strings = Stack<String>()

strings.push("Great!")
strings.push("is")
strings.push("Swift")

//strings.elements.removeAll() // The implementation details of `Stack` are hidden.

strings.peek()

while let string = strings.pop() {
  Logger.sharedInstance.log(string)
}
//Hello, Swift!
//Swift
//is
//Great!

/*: ### Challenge 3: Character battle (Битва персонажей) */
let elf = GameCharacterFactory.make(ofType: .elf)
let giant = GameCharacterFactory.make(ofType: .giant)
let wizard = GameCharacterFactory.make(ofType: .wizard)

battle(elf, vs: giant)
battle(wizard, vs: giant)
battle(wizard, vs: elf)


