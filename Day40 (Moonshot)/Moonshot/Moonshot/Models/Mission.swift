//
//  Mission.swift
//  Moonshot
//
//  Created by Pedro Acevedo on 16/05/24.
//

import Foundation

struct Mission: Codable, Identifiable {
    //Nested struct
    struct CrewRole: Codable {
            let name: String
            let role: String
    }
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
}
