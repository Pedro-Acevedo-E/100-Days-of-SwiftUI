//
//  SampleMusicAPI.swift
//  DemoApps1
//
//  Created by Pedro Acevedo on 29/05/24.
//

import SwiftUI

struct SampleMusicAPI: View {
    struct Response: Codable {
        var results: [Result]
    }
    
    struct Result: Codable {
        var trackId: Int
        var trackName: String
        var collectionName: String
        var artworkUrl100: String
    }
    
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            HStack {
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    Text(item.collectionName)
                }
                Spacer()
                AsyncImage(url: URL(string: item.artworkUrl100)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                .clipShape(.rect(cornerRadius: 25))
            }
        }
        .task {
            await loadData()
        }
        
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }

    }
}

#Preview {
    SampleMusicAPI()
}
