//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Pedro Acevedo on 05/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingUpcomingOnly = false
    
    var body: some View {
        //UserEditingApp()
        //FilterUsers()
        //UsersView()
        UserJobsView()
    }
}

#Preview {
    ContentView()
}
