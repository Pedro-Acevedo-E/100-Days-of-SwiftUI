import UIKit

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let goodDogs = true

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)

/*
 What was learned:
    1- In swift one can simply declare a boolean using a variable or constant
    2- Booleans can be toggled using "!" or ".toggle()"
    3- The result of certain operations swift does are in boolean
 */

let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

print("5 x 5 is \(5 * 5)")

/*
 What was learned:
    1- Various ways to combine the vales of strings
    2- String interpolation is a usefull tool to combine strings \()
*/
