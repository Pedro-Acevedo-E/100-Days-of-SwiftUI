import UIKit

//protocols
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    var name: String
    
    var currentPassengers: Int
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

//since we know Car is a Vehicle we can use a Car instance in the vehicle argument
func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car(name: "Mustang", currentPassengers: 2)
commute(distance: 100, using: car)

//Opaque return types
//We know the function "getRandomNumber" returns an integer and integer is an Equatable value so we can return that
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

//With opaque return types we can continue coding without worrying our code might break
//We can later change it to double or string and the code would still function the same

//Extensions le us add functionality to any type, even those created by apple
var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

//Using the trimmingCharacters function apple provides us we can remove the white space
print(quote)
print(trimmed)

//but calling that function is too long, we can add this to String (type) as a function
//using extensions so that we only call a single function insteaqd of the original method used before

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
let trimmed2 = quote.trimmed()
print(trimmed2)
