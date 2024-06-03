//
//  Order.swift
//  CupcakeCorner
//
//  Created by Pedro Acevedo on 29/05/24.
//

import SwiftUI

@Observable
class Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if stringIsEmpty(name) || stringIsEmpty(streetAddress) || stringIsEmpty(city) || stringIsEmpty(zip) {
            return false
        }
        
        return true
    }
    
    func stringIsEmpty(_ str: String) -> Bool {
        return str.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func saveAdress() {
        let userData = ["name": name, "streetAddress": streetAddress, "city": city, "zip": zip]
        if let encoded = try? JSONEncoder().encode(userData) {
            UserDefaults.standard.set(encoded, forKey: "UserData")
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "UserData") {
            if let userData = try? JSONDecoder().decode([String: String].self, from: data) {
                name = userData["name"] ?? ""
                streetAddress = userData["streetAddress"] ?? ""
                city = userData["city"] ?? ""
                zip = userData["zip"] ?? ""
                return
            }
        }
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more
        cost += (Double(type) / 2)
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
}
