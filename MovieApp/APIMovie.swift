//
//  APIMovie.swift
//  MovieApp
//
//  Created by Ronan Henry on 26/03/2023.
//

import Foundation

// 1 - Créer une structure avec toutes les props à récupérer
//     ⚠️ Chaque propriété doit avoir le même type que dans le JSON
// 1-A Conformer cette struct au protocole Decodable (ou directement Codable)
// 2 (optionnel) Créer une enum CodingKeys qui se conforme à String et CodingKey
// 3 - Associer chaque cas d'enum à la clé JSON correspondante

struct APIMovie: Codable {
    
    let id: Int
    let title: String
    let description: String
    let voteAverage: Float
    let imagePath: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description = "overview"
        case voteAverage = "vote_average"
        case imagePath = "poster_path"
    }
}

struct MoviePopularResults: Codable {
    let page: Int
    let results: [APIMovie]
}
