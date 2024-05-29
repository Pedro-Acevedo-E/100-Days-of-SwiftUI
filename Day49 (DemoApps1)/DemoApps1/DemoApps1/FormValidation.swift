//
//  FormValidation.swift
//  DemoApps1
//
//  Created by Pedro Acevedo on 29/05/24.
//

import SwiftUI

struct FormValidation: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
            .disabled(disableForm) //Disable submit if fields are too short
        }
    }
}

#Preview {
    FormValidation()
}
