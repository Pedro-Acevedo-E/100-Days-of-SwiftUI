//
//  QuestionView.swift
//  Edutainment
//
//  Created by Pedro Acevedo on 16/04/24.
//

import SwiftUI

struct QuestionView: View {
    @Binding var answer: String
    var question: Question
    
    var body: some View {
        HStack(alignment: .center) {
            Text("\(question.number1) X \(question.number2) =")
                .font(.title2)
                .frame(minWidth: 90, alignment: .trailing)
            
            TextField(
                "",
                text: $answer
            )
            .font(.title2)
            .frame(width: 60, height: 50)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.5)))
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
        }
        .frame(maxWidth: 180, minHeight: 70)
        .background(
            RoundedRectangle(
                cornerRadius: 25.0
            )
            .fill(
                Color.green.opacity(0.5)
            )
        )
    }
}

#Preview {
    QuestionView(answer: .constant(""), question: Question(number1: 2, number2: 3))
}
