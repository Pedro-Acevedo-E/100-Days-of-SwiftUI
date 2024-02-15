import UIKit

//Classes
/*
 Classes are simmilar to structs however, classes differ from structs in five key places:

 You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
 Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
 When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
 When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
 Even if you make a class constant, you can still change its properties as long as they are variables.
 */

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

//Class inheritance
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
    
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()
robert.printSummary()
joseph.printSummary()

//Class initializer
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

//Class initializer for inherited classes
class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

//How copying classes work
class User {
    var username = "Anonymous"

    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

//creating a copy the classic way gives us a reference to the first
var user1 = User()
var user2 = user1
user2.username = "Taylor"
print(user1.username)
print(user2.username)

//if we want to create a separate copy we can use tha "copy()" function we created instead
var user3 = User()
var user4 = user3.copy()
user4.username = "Taylor"
print(user3.username)
print(user4.username)

//clases deinitializers
//these are called whenever the object gets desctroyed
class People {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}
for i in 1...3 {
    let user = People(id: i)
    print("User \(user.id): I'm in control!")
}


var users = [People]()
for i in 1...3 {
    let user = People(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

//Variables inside classes
class Person {
    var name = "Paul"
}

let user = Person()
user.name = "Taylor"
print(user.name)

/*
 Here we are creating a constant user instance but since the property inside is a variable
 we can change it, even if the instance is a constant. The reason this works is because the
 class instance itself – the object we created – has not changed, and in fact can’t be
 changed because we made it constant
 */
