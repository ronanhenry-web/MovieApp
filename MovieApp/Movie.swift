//
//  Movie.swift
//  MovieApp
//
//  Created by Ronan Henry on 26/03/2023.
//

import Foundation

struct Movie: Identifiable {
    let id: Int
    let title: String
    let description: String
    let posterURL: URL
    let rating: Float
}

extension Movie {
    static let preview = Movie(
        id: 1,
        title: "John Wick : Chapitre 4",
        description: "John Wick affronte ses adversaires les plus redoutables dans ce quatrième volet de la série. De New York à Osaka, en passant par Paris et Berlin, John Wick mène un combat contre la Grande Table, la terrible organisation criminelle qui a mis sa tête à prix, en affrontant ses tueurs les plus dangereux...",
        posterURL: URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uiGArWE8nUjAoA1fA1um98ykL2I.jpg")!,
        rating: 8.9
    )
}
