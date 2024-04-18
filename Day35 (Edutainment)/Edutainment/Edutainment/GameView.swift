//
//  GameView.swift
//  Edutainment
//
//  Created by Pedro Acevedo on 16/04/24.
//

import SwiftUI

struct GameView: View {
    @Binding var questions: [Question]
    @Binding var answers: [String]
    let submitAnswers: () -> Void
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem()]) {
                ForEach(Array(questions.enumerated()), id: \.offset) { index, question in
                    QuestionView(answer: $answers[index], question: question)
                }
            }
            
            Button {
                submitAnswers()
            } label: {
                HStack {
                    Spacer()
                    Text("Check answers")
                        .font(.title)
                    Spacer()
                }
                .frame(maxWidth: 250, minHeight: 70)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.brown.opacity(0.5)))
                .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    GameView(
        questions: .constant(
            [
                Question(number1: 1, number2: 2),
                Question(number1: 12, number2: 12),
                Question(number1: 12, number2: 3)
            ]
        ),
        answers: .constant(
            [
                "",
                "",
                ""
            ]
        ),
        submitAnswers: {}
    )
}
