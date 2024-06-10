//
//  ContentView.swift
//  UserList
//
//  Created by Pedro Acevedo on 10/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                        }
                        Spacer()
                        Text(user.isActive ? "Active" : "Inactive")
                            .foregroundStyle(user.isActive ? .green : .red)
                    }
                }
            }
            .navigationTitle("User List")
            .navigationDestination(for: User.self) { selection in
                DetailsView(user: selection)
            }
        }
        .task {
            await loadUsers()
        }
    }
    
    func loadUsers() async {
        do {
            if(users.isEmpty) {
                let response = try await URLSession.shared.data(from: URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!)
                let decoded = try JSONDecoder().decode([User].self, from: response.0)
                users = decoded
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
