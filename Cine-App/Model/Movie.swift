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
    
    static var movies: [Movie] {
        return [
            Movie(id: 2, title: "Homem Aranha", releaseDate: "2020-05-04", image: "thor-image", overview: "", voteAverage: 5.0),
            Movie(id: 4, title: "Órfã 2: A Origem", releaseDate: "2022-07-27", image: "thor-image", overview: "", voteAverage: 7.8),
            Movie(id: 5, title: "Minions 2: A Origem de Gru", releaseDate: "2022-06-29", image: "thor-image", overview: "", voteAverage: 7.5),
            Movie(id: 7, title: "Thor: Amor e Trovão", releaseDate: "2020-05-04", image: "thor-image", overview: "", voteAverage: 8.0)
        ]
    }
    
    enum codingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case releaseDate = "release_date"
        case image = "poster_path"
        case overview = "overview"
        case voteAverage = "vote_average"
    }
}
