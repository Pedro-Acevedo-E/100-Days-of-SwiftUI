import UIKit

//Optionals
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

//Basic unwrapp
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

/*
 This if let syntax is very common in Swift, and combines creating a condition (if) with creating a constant (let). Together, it does three things:

 - It reads the optional value from the dictionary.
 - If the optional has a string inside, it gets unwrapped – that means the string inside gets placed into the marioOpposite constant.
 - The condition has succeeded – we were able to unwrap the optional – so the condition’s body is run.
 */

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

//this is called unwrapping

//How to unwrap optionals with guard
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}

printSquare(of: nil)
printSquare(of: 4)

//How to unwrap optionals using nil coalescing
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

//Here were trying to access data that does not exist so it will be nil
//Using the nil coalescing operator "??" we can assign a default value for any optional
let new = captains["Serenity"] ?? "N/A"
print(new)

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

//Handle multiple optionals using optional chaining
//This is basically reading optionals inside optionals
var book2: Book? = nil
let author2 = book2?.author?.first?.uppercased() ?? "A"
print(author2)

//So, it reads “if we have a book, and the book has an author, and the author has a first letter, then uppercase it and send it back, otherwise send back A”.

//Function failure with optionals
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user2 = (try? getUser(id: 23)) ?? "Anonymous"
print(user2)
