import UIKit

//This is a struct...
//Struct is a way that we can create our on complex data types, complete with their own variables and functions.
struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

//How can we change data in a struct using functions?
struct Employee {
    let name: String
    var vacationRemaining: Int

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}
//We add the "mutating" keyword inside a function of the struct to be able to change its values

/*
 Here are some rules for structs:
    1 - Variables and constants that belong to structs are called properties
    2 - Functions that belong to structs are called methods
    3 - When we create a struct we call that an instance
    4 - When we creata an instance of a struct we need to use an initializer
 */

//COMPUTED PROPERTIES
struct Person {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    //Getters and setters... this is a computed property
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Person(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)

//How to take action when a property changes?
struct Game {
    var score = 0 {
        willSet {
            print("Current value is: \(score)")
            print("New value will be: \(newValue)")
        }
        didSet {
            print("The new value is now \(score)")
            print("Old value was \(oldValue)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

//Custom initializers
struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)
