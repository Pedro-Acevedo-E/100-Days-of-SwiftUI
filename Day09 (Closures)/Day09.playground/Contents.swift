import UIKit

/*
 Closures are self contained blocks of functionality that can be assigned to variables or passed as arguments to functions.
 */

//You can store functions inside variables
func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy: () -> Void = greetUser //Type is for demonstration here you can ommit type
greetCopy()

//Another way to store functions
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

//Using a closure expression we can assign a function directly
let sayHello = {
    print("Hi there!")
}
sayHello()

//Lets cal the function "sorted()" using a closure
let team = ["Piper", "Gloria", "Tiffany", "Suzanne", "Tasha"]
var captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

print(captainFirstTeam)

/*
 There is a LOT going on here
 1- First we say were caalling the "sorted" function, we use the argument "by:"
 2- This argument expects a function that will tell us how to order the array
 3- Each time we return true we tell the sorted function to swap places
 4- Notice the name1 & name2, these represent a pair of elements coming from the array
 5- These 2 elements will be compared one by one until no more elements are left
 */

//How can we make make this shorter? trailing closure syntax
captainFirstTeam = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

//How can we make make this shorter? shorthand syntax
captainFirstTeam = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}

//Lets see an example using the filter function
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

//lets see an example using the map function
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

//How can we use closures in a function?
//Lets take a look a this function...
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

//we can call this function using closure syntax...
let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

//we can also call them using a function stored in a variable
func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

//you can also add multiple functions...
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}
