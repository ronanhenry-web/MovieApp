//
//  Actor.swift
//  MovieApp
//
//  Created by Ronan Henry on 26/03/2023.
//

import Foundation

struct Actor: Identifiable {
    let id = UUID()
    let name: String
    let profileURL: URL?
    let characterName: String
}

extension Actor {
    static let previewActors = [
        Actor(
            name: "Test actor",
            profileURL: nil,
            characterName: "Test character"
        ),
        Actor(
            name: "Test actor 2",
            profileURL: nil,
            characterName: "Test character 2"
        ),
        Actor(
            name: "Test actor 3",
            profileURL: nil,
            characterName: "Test character 3"
        )
    ]
}
