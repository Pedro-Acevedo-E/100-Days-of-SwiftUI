//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Pedro Acevedo on 18/03/24.
//

import SwiftUI

struct FlagImage: View {
    let country: String
    
    var body: some View {
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var moves = [
        "Rock", 
        "Paper",
        "Scissors"
    ]
    
    private var correctMove = [
        "Rock" : "Paper",
        "Paper": "Scissors",
        "Scissors": "Rock"
    ]
    
    @State private var selection = Int.random(in: 0...2)
    @State private var win = Bool.random()
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, .blue], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack {
                Text("Let's Play Rock Paper Scissors!")
                    .font(.title.weight(.bold))
                    .multilineTextAlignment(.center)
                Text("I Choose!")
                    .font(.title.weight(.bold))
                    .multilineTextAlignment(.center)
                Image(moves[selection])
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
                Text("Choose the option that \n" + (win ? "Wins you the game" : "Makes you lose the game"))
                    .font(.title2.weight(.bold))
                    .multilineTextAlignment(.center)
                HStack {
                    ForEach(0..<3) { number in
                        Button {
                            optionTapped(number)
                        } label: {
                            Image(moves[number])
                                .resizable()
                                .frame(maxWidth: 100, maxHeight: 100)
                        }
                    }
                }
                
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is " + String(score))
        }
        
    }
    
    func askQuestion() {
        win.toggle()
        selection = Int.random(in: 0...2)
    }
    
    func optionTapped(_ number: Int) {
        let result = win ?
            moves[number] == correctMove[moves[selection]] :
            moves[selection] == correctMove[moves[number]]
        score += result ? 1 : 0
        scoreTitle = result ? "Correct!" : "Incorrect, try again"
        showingScore = true
    }
}

#Preview {
    ContentView()
}
