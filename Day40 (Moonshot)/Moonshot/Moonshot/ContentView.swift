//
//  ContentView.swift
//  Moonshot
//
//  Created by Pedro Acevedo on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var columns: [GridItem] {
        if(showingGrid) {
            return [GridItem(.adaptive(minimum: 150))]
        } else {
            return [GridItem(.adaptive(minimum: .infinity))]
        }
    }
    
    @State private var showingGrid = true
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()

                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        showingGrid.toggle()
                    }) {
                        Text(showingGrid ? "Show List" : "Show Grid")
                            .bold()
                    }
                }
            }
            .preferredColorScheme(.dark)
            
        }
    }
}

#Preview {
    ContentView()
}
