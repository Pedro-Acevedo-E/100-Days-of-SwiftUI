//
//  FlterUsers.swift
//  SwiftDataProject
//
//  Created by Pedro Acevedo on 05/06/24.
//

import SwiftUI
import SwiftData

struct FilterUsers: View {
    @Environment(\.modelContext) var modelContext
    
    //Query orders users alphabetically, finds users that have an R (lower or uppercase) and live in London
    //Right click on #Predicate click on "Expand Macro" to see the actual code being run
    @Query(filter: #Predicate<User> { user in
        user.name.localizedStandardContains("R") &&
        user.city == "London"
    }, sort: \User.name) var users: [User]
    
    /*
     Here is another way to write the same Query
     @Query(filter: #Predicate<User> { user in
         if user.name.localizedStandardContains("R") {
             if user.city == "London" {
                 return true
             } else {
                 return false
             }
         } else {
             return false
         }
     }, sort: \User.name) var users: [User]
     */
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                Text(user.name)
            }
            .navigationTitle("Filtering Users")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))

                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
            }
        }
    }
}

#Preview {
    FilterUsers()
}
