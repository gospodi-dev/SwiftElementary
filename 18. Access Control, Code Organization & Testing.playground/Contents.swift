/*: # Глава 18. Access Control, Code Organization & Testing (Контроль доступа, организация кода и тестирование) */
/*: ## Part 01. Problems introduced by lack of access control (Проблемы, возникающие из-за отсутствия контроля доступа) */

/// A protocol describing core functionality for an account
protocol Account {
  associatedtype Currency

  var balance: Currency { get }
  func deposit(amount: Currency)
  func withdraw(amount: Currency)
}

typealias Dollars = Double

/// A U.S. Dollar based "basic" account.
class BasicAccount: Account {

  var balance: Dollars = 0.0

  func deposit(amount: Dollars) {
    balance += amount
  }

  func withdraw(amount: Dollars) {
    if amount <= balance {
      balance -= amount
    } else {
      balance = 0
    }
  }
}

// Создайте новую учетную запись
let account = BasicAccount()

// Вносить и снимать деньги
account.deposit(amount: 10.00)
account.withdraw(amount: 5.00)

// ... или творить зло!
account.balance = 1000000.00
