//
//  Activity.swift
//  HabitTracker
//
//  Created by Pedro Acevedo on 24/05/24.
//

import Foundation

struct Activity: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    let title: String
    let description: String
    let completedAmount: Int
}
