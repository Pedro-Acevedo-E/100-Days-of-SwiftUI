//
//  UserListApp.swift
//  UserList
//
//  Created by Pedro Acevedo on 10/06/24.
//

import SwiftUI
import SwiftData

@main
struct UserListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
