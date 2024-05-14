//
//  ContentView.swift
//  iExpense
//
//  Created by Pedro Acevedo on 13/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Section ("Personal") {
                    List {
                        ForEach(expenses.items) { item in
                            if (item.type == "Personal") {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        Text(item.type)
                                    }

                                    Spacer()
                                    Text(
                                        item.amount,
                                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                                    )
                                    .foregroundStyle(item.amount < 100 ? (item.amount < 10 ? .blue : .green) : .red)
                                }
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                }
                Section ("Business") {
                    List {
                        ForEach(expenses.items) { item in
                            if (item.type != "Personal") {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        Text(item.type)
                                    }

                                    Spacer()
                                    Text(
                                        item.amount,
                                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                                    )
                                    .foregroundStyle(item.amount < 100 ? (item.amount < 10 ? .blue : .green) : .red)
                                }
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
