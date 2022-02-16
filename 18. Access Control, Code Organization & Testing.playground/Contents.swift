/*: # Глава 18. Access Control, Code Organization & Testing (Контроль доступа, организация кода и тестирование) */
/*: ## Part 01. Problems introduced by lack of access control (Проблемы, возникающие из-за отсутствия контроля доступа) */
import Foundation
/// A protocol describing core functionality for an account


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


