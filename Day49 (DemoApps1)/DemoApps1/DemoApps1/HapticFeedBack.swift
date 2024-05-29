//
//  HapticFeedBack.swift
//  DemoApps1
//
//  Created by Pedro Acevedo on 29/05/24.
//

import SwiftUI

struct HapticFeedBack: View {
    @State private var counter = 0
    @State private var counterColission = 0
    
    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
        .sensoryFeedback(.increase, trigger: counter)
        
        Button("Trigger Colission \(counterColission)") {
            counterColission += 1
        }
        .sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: counterColission)
    }
}

#Preview {
    HapticFeedBack()
}
