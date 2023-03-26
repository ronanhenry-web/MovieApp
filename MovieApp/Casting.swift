//
//  Casting.swift
//  MovieApp
//
//  Created by Ronan Henry on 26/03/2023.
//

import Foundation

class Casting: ObservableObject {
    @Published var actors: [Actor]
    
    init(actors: [Actor]) {
        self.actors = actors
    }
}
