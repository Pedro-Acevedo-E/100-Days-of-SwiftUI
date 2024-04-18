//
//  MainMenuView.swift
//  Edutainment
//
//  Created by Pedro Acevedo on 16/04/24.
//

import SwiftUI

struct MainMenuView: View {
    @Binding var multiplicationTable: Int
    @Binding var numberOfquestions: Int
    let generateQuestions: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Select Multiplication table")
                .font(.title)
            Stepper("\(multiplicationTable) ", value: $multiplicationTable, in: 2...12, step: 1)
                .font(.title2)
                .frame(maxWidth: 130)
                .frame(maxWidth: 150, minHeight: 50)
                .background(
                    RoundedRectangle(cornerRadius: 10).fill(
                        Color.gray.opacity(0.5)
                    )
                )
        }
        .frame(maxWidth: 350, minHeight: 110)
        .background(
            RoundedRectangle(cornerRadius: 20).fill(
                Color.brown
            )
        )
        
        VStack(spacing: 10){
            Text("How many questions?")
                .font(.title)
            Stepper("\(numberOfquestions) ", value: $numberOfquestions, in: 5...15, step: 5)
                .font(.title2)
                .frame(maxWidth: 130)
                .frame(maxWidth: 150, minHeight: 50)
                .background(
                    RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.5))
                )
        }
        .frame(maxWidth: 350, minHeight: 110)
        .background(
            RoundedRectangle(cornerRadius: 20).fill(
                Color.brown
            )
        )
        
        Button {
            generateQuestions()
        } label: {
            HStack {
                Spacer()
                Text("Start Game")
                    .font(.title)
                    .foregroundColor(.black)
                Spacer()
            }
        }
        .frame(maxWidth: 350, minHeight: 70)
        .background(
            RoundedRectangle(cornerRadius: 20).fill(
                Color.brown
            )
        )
    }
}

#Preview {
    MainMenuView(
        multiplicationTable: .constant(10),
        numberOfquestions: .constant(10),
        generateQuestions: {}
    )
}
