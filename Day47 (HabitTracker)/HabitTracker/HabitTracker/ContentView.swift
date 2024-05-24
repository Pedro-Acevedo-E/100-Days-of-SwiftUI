//
//  ContentView.swift
//  HabitTracker
//
//  Created by Pedro Acevedo on 24/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var activities = Activities()
    @State private var showingAddActivity = false
    @State private var path = [Activity]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List() {
                    ForEach(activities.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text("Completed: " + String(item.completedAmount) + " Times")
                            }
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            path = [item]
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                .navigationDestination(for: Activity.self) { selection in
                    DetailView(activity: selection, activities: activities)
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddActivity = true
                }
            }
        }
        .sheet(isPresented: $showingAddActivity) {
            AddView(activities: activities)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}

