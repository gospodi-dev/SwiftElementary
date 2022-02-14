/*: # Глава 16. Protocols (Протоколы) */
/*: ## Part 01. Protocol syntax (Синтаксис протокола) */

protocol Vehicle {
    func accelerate()
    func stop()
}

// let vehicle = Vehicle() // error: 'Vehicle' cannot be constructed because it has no accessible initializers (ошибка: 'Vehicle' не может быть построен, потому что у него нет доступных инициализаторов)

class Unicycle: Vehicle {
    var peddling = false
    
    func accelerate() {
        peddling = true
    }
    
    func stop() {
        peddling = false
    }
}

