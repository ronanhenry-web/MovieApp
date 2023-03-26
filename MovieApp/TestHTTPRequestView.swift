//
//  TestHttpRequestView.swift
//  MovieApp
//
//  Created by Ronan Henry on 26/03/2023.
//

import SwiftUI

struct TestHttpRequestView: View {

    let dataURL = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=ee6b2b9e0970948e6741d6b7985191fb")!
    
    @State private var textContent = "Loading..."
    
    @State private var movieTitles: [String] = []
    
    var body: some View {
        List {
            ForEach(movieTitles, id: \.self) { title in
                Text(title)
            }
            Button {
                loadMovies()
            } label: {
                Text("Load movies")
            }
        }
    }
    
    func loadMovies() {
        Task {
            let (data, _) = try await URLSession.shared.data(from: dataURL)
            
            do {
                let moviePopularResults = try JSONDecoder().decode(MoviePopularResults.self, from: data)
                
                for apiMovie in moviePopularResults.results {
                    movieTitles.append(apiMovie.title)
                }
            } catch {
                print("❌ Erreur de décodage")
            }
        }
    }
}

struct TestHttpRequestView_Previews: PreviewProvider {
    static var previews: some View {
        TestHttpRequestView()
    }
}
