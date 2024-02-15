import UIKit

//Type annotations----------------------------------------------------------------------
let surname: String = "Lasso"
var score: Int = 0
var scoreDouble: Double = 0
var albums: [String] = ["Red", "Fearless"]

//Dictionary type annotation
var user: [String: String] = ["id": "@twostraws"]

//Set type annotation
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

//How to create an empty array
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

//Challenge
let names = ["pedro", "susan", "gabriel", "fernando", "pedro", "gabriel"]
print("The number of items in the array is: \(names.count)")
print("The number of unique items in the array are: \(Set(names).count)")

