//
//  ContentView.swift
//  Edutainment
//
//  Created by Pedro Acevedo on 12/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var multiplicationTable = 2
    @State private var numberOfquestions = 5
    @State private var questions: [Question] = []
    @State private var answers: [String] = []
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.5)
                .ignoresSafeArea()
            VStack {
                if(questions.count == 0) {
                    MainMenuView(
                        multiplicationTable: $multiplicationTable,
                        numberOfquestions: $numberOfquestions,
                        generateQuestions: generateQuestions)
                }
                
                if(questions.count > 0) {
                    GameView(
                        questions: $questions,
                        answers: $answers,
                        submitAnswers: submitAnswers
                    )
                }
                
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            HStack {
                Button("Play Again?", action: generateQuestions)
                Button("Cancel", action: restart)
            }
        } message: {
            Text("Yo got " + String(score) + " correct answers!")
        }
        
    }
    
    func generateQuestions() {
        withAnimation(.default) {
            score = 0
            questions = []
            answers = []
            for _ in 0..<numberOfquestions {
                //check for repeat questions...
                let question = Question(number1: multiplicationTable, number2: Int.random(in: 1...20))
                questions.append(question)
                answers.append("")
            }
        }
    }
    
    func restart() {
        score = 0
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        
        withAnimation(.default) {
            questions = []
            answers = []
        }
    }
    
    func submitAnswers() {
        for i in 0..<numberOfquestions {
            if (Int(answers[i]) == questions[i].correctAnswer) {
                score += 1
            }
        }
        showingScore.toggle()
    }
}

struct Question: Hashable, Identifiable {
    var id = UUID().uuidString
    
    var number1: Int
    var number2: Int
    
    var correctAnswer: Int {
        number1 * number2
    }
}

#Preview {
    ContentView()
}
