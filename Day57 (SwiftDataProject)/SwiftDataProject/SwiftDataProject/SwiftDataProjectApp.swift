//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Pedro Acevedo on 05/06/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
