//
//  DetailView.swift
//  HabitTracker
//
//  Created by Pedro Acevedo on 24/05/24.
//

import SwiftUI

struct DetailView: View {
    let activity: Activity
    var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Description:")
                    .font(.headline)
                Text(activity.description)
                HStack {
                    Text("Completed: ")
                    Text(String(activity.completedAmount) + " Times ")
                    Spacer()
                }
                .font(.headline)
                
                Button("Completed activity today") {
                    if let firstIndex = activities.items.firstIndex(of: activity) {
                        let item = Activity(
                            title: activity.title,
                            description: activity.description,
                            completedAmount: activity.completedAmount + 1
                        )
                        activities.items[firstIndex] = item
                    }
                    dismiss()
                }
                .font(.headline)
                .bold()
            }
        }
        .navigationTitle(activity.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(
        activity: Activity(title: "Test", description: "Test", completedAmount: 0),
        activities: Activities()
    )
}
