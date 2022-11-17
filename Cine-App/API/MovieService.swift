//
//  MovieService.swift
//  Cine-App
//
//  Created by João Alexandre Bitar on 17/11/22.
//

import Foundation

struct MovieService {
    static let shared = MovieService()
    
    func fetchPopularMovies(completion: @escaping(MovieResult) -> Void) {
        guard let url = URL(
            string: "https://api.themoviedb.org/3/movie/popular?api_key=\(MOVIE_API_KEY)&language=pt-BR&page=1"
        ) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(MovieResult.self, from: data)
                completion(response)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
