//
//  SearchMoviesService.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 25/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

final class SearchMoviesService: SearchMoviesServiceInput {
    var output: SearchMoviesServiceOutput?
    
    func fetchSearchMovie(string: String, page: Int) {
        API.request(from: .searchMovie(query: string, language: API.Language.enUS.type, page: page), type: SearchOutput.self) { [weak self] response in
            switch response {
            case .success(let result):
                self?.output?.fetchSearcMoviesSucceeded(output: result)
            case .failure(_), .APIError(_):
                self?.output?.fetchSearchMoviesFailed(message: "movies search failed")
            }
            
        }
    }
    
    
}
