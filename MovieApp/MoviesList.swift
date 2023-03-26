//
//  MoviesList.swift
//  MovieApp
//
//  Created by Ronan Henry on 26/03/2023.
//

import Foundation

class MoviesList: ObservableObject {
    @Published var popularMovies: [Movie]
    
    init(popularMovies: [Movie]) {
        self.popularMovies = popularMovies
    }
}
