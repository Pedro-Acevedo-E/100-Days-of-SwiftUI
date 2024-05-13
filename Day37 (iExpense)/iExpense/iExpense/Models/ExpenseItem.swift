//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Pedro Acevedo on 13/05/24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
