//
//  ContentView.swift
//  DemoApps1
//
//  Created by Pedro Acevedo on 29/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Music list API") {
                SampleMusicAPI()
            }
            NavigationLink("Form Validation") {
                FormValidation()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
