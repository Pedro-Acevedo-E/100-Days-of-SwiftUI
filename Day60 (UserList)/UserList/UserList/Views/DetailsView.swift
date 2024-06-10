//
//  DetailsView.swift
//  UserList
//
//  Created by Pedro Acevedo on 10/06/24.
//

import SwiftUI

struct DetailsView: View {
    let user: User
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.title.bold())
                    .padding(.bottom, 5)
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.gray.opacity(0.6))
                    .padding(.vertical)
                
                Text("Age: \(user.age)")
                Text("Company: \(user.company)")
                Text("email: \(user.email)")
                Text("Status: \(user.isActive ? "Active" : "Not Active")")
                HStack {
                    Text("Registered: ")
                    Text(ISO8601DateFormatter().date(from: user.registered) ?? Date.now, format: .dateTime.day().month().year())
                }
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.gray.opacity(0.6))
                    .padding(.vertical)
                
                Text("About:")
                    .font(.title2.bold())
                    .padding(.bottom, 5)
                Text(user.about)
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.gray.opacity(0.6))
                    .padding(.vertical)
                
                Text("Friends:")
                    .font(.title2.bold())
                    .padding(.bottom, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(user.friends) { friend in
                            Text(friend.name)
                            Rectangle()
                                .frame(width: 2)
                                .foregroundStyle(.gray.opacity(0.6))
                                .padding(.horizontal)
                        }
                    }
                }
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.gray.opacity(0.6))
                    .padding(.vertical)
                
                Text("Tags:")
                    .font(.title2.bold())
                    .padding(.bottom, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(user.tags, id: \.self) { tag in
                            Text(tag)
                            Rectangle()
                                .frame(width: 2)
                                .foregroundStyle(.gray.opacity(0.6))
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    DetailsView(user: User(
        id: "12345678",
        isActive: true,
        name: "Stevan",
        age: 19,
        company: "Honey company inc.",
        email: "honey@gmail.com",
        address: "",
        about: "A hard working average joe",
        registered: "Yes",
        tags: [],
        friends: [])
    )
}
