//
//  ContentView.swift
//  UserList
//
//  Created by Pedro Acevedo on 10/06/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    @State private var loading = false
    
    var body: some View {
        NavigationStack {
            if (loading) {
                ProgressView()
            } else {
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
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Delete", systemImage: "trash") {
                            deleteUsers()
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Delete", systemImage: "gobackward") {
                            Task {
                                await loadUsers()
                            }
                        }
                    }
                }
            }
        }
        .task {
            await loadUsers()
        }
    }
    
    func loadUsers() async {
        loading = true
        do {
            if(users.isEmpty) {
                let response = try await URLSession.shared.data(from: URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!)
                let decoded = try JSONDecoder().decode([User].self, from: response.0)
                try modelContext.transaction {
                  for user in decoded {
                      modelContext.insert(user)
                  }
                }
            }
            loading = false
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func deleteUsers() {
        do {
            try modelContext.delete(model: User.self)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
