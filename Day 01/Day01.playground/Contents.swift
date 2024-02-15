import UIKit

var greeting = "Hello, playground"

//Variables
var name = "Ted"
name = "Rebecca"
name = "Keeley"

//Constants
let character = "Daphne"

var playerName = "Roy"
print(playerName)
playerName = "Sam"
print(playerName)
playerName = "Dani"
print(playerName)

/*
 What was learned:
    1- Variables are declared with "var" keyword
    2- Constants are declared with "let" keyword and its value cannot be changed after declaration
    3- For swift a good variable naming convention is used called "camel_case"
    4- Whenever nescesary always try to use constants first, this helps optimizes our code
 */

let actor = "Denzel Washington"
let filename = "paris.jpg"
let emojiString = "🐰 you win!"
let quote = "Then he tapped a sign saying \"Believe\" and walked away"
let multilineString = """
A day in the
life of an
Apple engineer
"""

print(actor.count)
print(actor.uppercased())
print(multilineString.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))

/*
 What was learned:
    1- To store strings you need " (double quotes)
    2- You can write emojis in strings
    3- If you need to write "" inside a string you can use /
    4- If you need to write multiline strings you can use """ (Triple double quotes)
    5- There are many operations swift can do with strings, most of them are uppercase sensitive
 */

let score = 10
let reallyBig = 100000000
let reallyBigEzToRead = 100_000_000
let lowerScore = score - 2
var counter = 10
counter = counter + 5   //Can be reduced...
counter += 5            //Using "Compound assignment" operators
print(counter)

let number = 120
print(number.isMultiple(of: 3))

/*
 What was learned:
    1- To declare an integer just assign a "whole" number to a variable or constant
    2- You can divide large numbers using "_" swift will ignore these symbols
 */

let decimal = 0.1 + 0.2
print(decimal)
let a = 1
let b = 2.0
let c = Double(a) + b
var rating = 5.0
rating *= 2

/*
 What was learned:
    1- To declare a decimal number just assign a number that includes a "." for example 9.56
    2- You cannot combine integers with doubles in the same operations, you must transform the number before you continue
 */







