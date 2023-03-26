//
//  APIActor.swift
//  MovieApp
//
//  Created by Ronan Henry on 26/03/2023.
//

import Foundation

struct APIActor: Codable {
    let name: String
    let character: String
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case character
        case profilePath = "profile_path"
    }
}
