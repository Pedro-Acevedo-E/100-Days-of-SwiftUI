import UIKit

//ARRAYS-----------------------------------------------------------------------------------
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

//Access array data
print(beatles[0])
print(numbers[1])
print(temperatures[2])

//Add items to array
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

//Create an empty array
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

//Another way to create an empty array
var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

//Array operations
print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.remove(at: 2)
print(characters.count)
characters.removeAll()
print(characters.count)

let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

//Sort arrays
let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

//DICTIONARIES-----------------------------------------------------------------------------
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

//You can access elements by using the ID
print(employee2["name"] ?? "")
print(employee2["job"] ?? "")
print(employee2["location"] ?? "")

//You can store other data types
let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false,
]

//The ID does not need to be a string, you can use integers
let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])

//You can also declare empty dictionaries
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206
print(heights)

//SETS-------------------------------------------------------------------------------------
let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
print(people)

var otherPeople = Set<String>()
otherPeople.insert("Denzel Washington")
otherPeople.insert("Tom Cruise")
otherPeople.insert("Nicolas Cage")
otherPeople.insert("Samuel L Jackson")

//ENUMS------------------------------------------------------------------------------------
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = Weekday.tuesday
day = .friday
