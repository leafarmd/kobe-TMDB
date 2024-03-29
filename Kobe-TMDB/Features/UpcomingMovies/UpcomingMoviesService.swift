//
//  UpcomingMoviesService.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 24/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

final class UpcomingMoviesService: UpcomingMoviesServiceInput {
    weak var output: UpcomingMoviesServiceOutput?
    
    func fetchUpcomingMovies(page number: Int) {
        API.request(from: .upcoming(language: API.Language.enUS.type, page: number), type: UpcomingMoviesOutput.self) { [weak self] response in
            
            switch response {
            case .success(let result):
                self?.output?.fetchUpcomingMoviesSucceeded(output: result)
            case .failure(let failure):
                self?.output?.fetchUpcomingMoviesFailed(message: failure.message)
            case .APIError(let error):
                self?.output?.fetchUpcomingMoviesFailed(message: error.message ?? "unknow error")
            }
        }
    }
}
