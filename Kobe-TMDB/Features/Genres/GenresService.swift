//
//  GenresService.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 25/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation

final class GenresService: GenresServiceInput {
    weak var output: GenresServiceOutput?
    
    
    func fetchGenres() {
        API.request(from: .genre, type: GenresOutput.self) { [weak self] response in
            switch response {
            case .success(let result):
                self?.output?.fetchGenresSucceeded(output: result.genres)
            case .failure(_), .APIError(_):
                self?.output?.fetchGenresFailed(message: "failed request movie genres")
            }
        }
    }
}
