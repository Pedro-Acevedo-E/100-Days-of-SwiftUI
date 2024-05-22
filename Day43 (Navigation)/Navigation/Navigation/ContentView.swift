//
//  ContentView.swift
//  Navigation
//
//  Created by Pedro Acevedo on 22/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap Me") {
                DetailView(number: 556)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct DetailView: View {
    var number: Int

    var body: some View {
        Text("Detail View \(number)")
    }

    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}
