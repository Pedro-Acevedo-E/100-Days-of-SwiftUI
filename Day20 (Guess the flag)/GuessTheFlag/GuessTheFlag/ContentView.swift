//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Pedro Acevedo on 05/03/24.
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
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var score = 0
    
    @State private var animationAmount = [0.0, 0.0, 0.0]
    @State private var fadeOutAmount = [1.0, 1.0, 1.0]
    @State private var scaleAmount = [1.0, 1.0, 1.0]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                                animationAmount[number] += 360
                                for (index, element) in fadeOutAmount.enumerated() {
                                    if index != number {
                                        fadeOutAmount[index] = element / 4
                                        scaleAmount[index] = element / 2
                                    }
                                }
                            }
                        } label: {
                            FlagImage(country: countries[number])
                        }
                        .rotation3DEffect(.degrees(animationAmount[number]), axis: (x: 0, y: 1, z: 0))
                        .opacity(fadeOutAmount[number])
                        .scaleEffect(scaleAmount[number])
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Score: " + String(score))
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
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
        withAnimation(.spring(duration: 1, bounce: 0.5)) {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            for (i, _) in fadeOutAmount.enumerated() {
                fadeOutAmount[i] = 1.0
                scaleAmount[i] = 1.0
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            if (score >= 8) {
                scoreTitle = "Correct, game over"
                score = 0
            } else {
                scoreTitle = "Correct"
                score += 1
            }
        } else {
            scoreTitle = "Wrong thats the flag of " + countries[number]
        }

        showingScore = true
    }
}

#Preview {
    ContentView()
}
