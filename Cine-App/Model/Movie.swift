//
//  Movie.swift
//  Cine-App
//
//  Created by João Alexandre Bitar on 16/11/22.
//

import Foundation

struct MovieResult: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int?
    let title: String?
    let release_date: String?
    let poster_path: String?
    let overview: String?
    let vote_average: Double?
}
