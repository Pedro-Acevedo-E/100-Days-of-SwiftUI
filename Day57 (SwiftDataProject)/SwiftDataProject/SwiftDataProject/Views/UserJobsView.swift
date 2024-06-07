//
//  UserJobsView.swift
//  SwiftDataProject
//
//  Created by Pedro Acevedo on 07/06/24.
//

import SwiftUI
import SwiftData

struct UserJobsView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: \User.name) var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                HStack {
                    Text(user.name)

                    Spacer()

                    Text(String(user.jobs.count))
                        .fontWeight(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
            }
            .navigationTitle("User Job Relation")
            .toolbar {
                Button("Add Sample User", systemImage: "plus") {
                    addSample()
                }
            }
        }
    }
    
    func addSample() {
        let user1 = User(name: "Piper Chapman", city: "New York", joinDate: .now)
        let job1 = Job(name: "Organize sock drawer", priority: 3)
        let job2 = Job(name: "Make plans with Alex", priority: 4)

        modelContext.insert(user1)

        user1.jobs.append(job1)
        user1.jobs.append(job2)
    }
}

#Preview {
    UserJobsView()
}
