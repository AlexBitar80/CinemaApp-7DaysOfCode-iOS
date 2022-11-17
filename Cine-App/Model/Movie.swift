//
//  Movie.swift
//  Cine-App
//
//  Created by João Alexandre Bitar on 16/11/22.
//

import Foundation

struct Movie: Codable {
    let id: Int?
    let title: String?
    let releaseDate: String?
    let image: String?
    let overview: String?
    let voteAverage: Double?
    
    enum codingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case releaseDate = "release_date"
        case image = "poster_path"
        case overview = "overview"
        case voteAverage = "vote_average"
    }
}
