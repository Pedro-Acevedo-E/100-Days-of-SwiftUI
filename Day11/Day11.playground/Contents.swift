import UIKit

//Access control
struct BankAccount {
    private var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

/*Since funds property is private, we cannot access it like so
    account.funds -= 1000
 
 Swift provides us with several options, but when you’re learning you’ll only need a handful:
     Use private for “don’t let anything outside the struct use this.”
     Use fileprivate for “don’t let anything outside the current file use this.”
     Use public for “let anyone, anywhere use this.”
 */

//static properties
struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

/*
 sometimes you want to access some properties and methods without having to create an instance
 static properties are usefull in this manner
 */

//This is usefull when saving data about your app
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

//Its also very usefull when you want to provide an example instance of a struct
struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}
