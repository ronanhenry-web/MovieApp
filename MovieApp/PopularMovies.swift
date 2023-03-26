//
//  PopularMovies.swift
//  MovieApp
//
//  Created by Ronan Henry on 26/03/2023.
//

import SwiftUI

// 1 - Créer une vue avec un bouton "Load" ✅
// 2 - Ce bouton appelle la méthode "loadMovies()" ✅
// 3 - Cette méthode permet d'afficher X faux films
// 4 - Contrainte : rester sur la même vue

struct PopularMovies: View {
    
    @StateObject private var moviesList = MoviesList(popularMovies: [])

    var body: some View {
        // Afficher une liste de films
        // Ajouter un bouton "Load"
        if moviesList.popularMovies.isEmpty {
            Button {
                loadMovies()
            } label: {
                Text("Load")
            }
        } else {
            NavigationView {
                ScrollView {
                    VStack {
                        Text("\(moviesList.popularMovies.count) films")
                            .foregroundColor(.white)
                        ForEach(moviesList.popularMovies) { movie in
                            NavigationLink {
                                MovieDetailView(movie: movie)
                            } label: {
                                MovieCellView(movie: movie)
                            }
                        }
                    }
                }
                .background(.black)
                .navigationTitle("Popular Movies")
                .toolbar {
                    ToolbarItem {
                        Button {
                            //
                        } label: {
                            Image(systemName: "star")
                        }
                    }
                }
            }
            
        }
    }
    
    func loadMovies() {
        Task {
            // Fetcher les vrais popular movies
            
            let popularMovieURL = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=ee6b2b9e0970948e6741d6b7985191fb")!
            
            do {
                let (data, _) = try await URLSession.shared.data(from: popularMovieURL)
                
                let moviePopularResults = try JSONDecoder().decode(MoviePopularResults.self, from: data)
                
                for apiMovie in moviePopularResults.results {
                    
                    let newMovie = Movie(
                        id: apiMovie.id,
                        title: apiMovie.title,
                        description: apiMovie.description,
                        posterURL: URL(string: "https://image.tmdb.org/t/p/w500/\(apiMovie.imagePath)")!,
                        rating: apiMovie.voteAverage
                    )
                    
                    moviesList.popularMovies.append(newMovie)
                }
                
            } catch {
                
            }
        }
    }
}

struct PopularMovies_Previews: PreviewProvider {
    static var previews: some View {
        PopularMovies()
    }
}
