//
//  AddView.swift
//  HabitTracker
//
//  Created by Pedro Acevedo on 24/05/24.
//

import SwiftUI

struct AddView: View {
    @State private var title = ""
    @State private var description = ""
    
    @Environment(\.dismiss) var dismiss
    var activities: Activities

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)

                TextField("Desciption", text: $description, axis: .vertical)
                    .lineLimit(5...10)
            }
            .navigationTitle("Add new Activity")
            .toolbar {
                Button("Save") {
                    let item = Activity(title: title, description: description, completedAmount: 0)
                    activities.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(activities: Activities())
}

