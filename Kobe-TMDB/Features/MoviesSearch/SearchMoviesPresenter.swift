//
//  SearchMoviesPresenter.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 25/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation

final class SearchMoviesPresenter {
    
    
    weak var view: SearchMoviesView?
    private var totalPages = 1
    private var page = 1
    private var query = ""
    private var movies: [MovieModel] = []
    
    private let service = SearchMoviesService()
    private let router: SearchMovieRouter
    
    init(router: SearchMovieRouter) {
        self.router = router
        service.output = self
    }
    
    func attachView(_ view: SearchMoviesView) {
        self.view = view
    }
    
    func actualRow(_ row: Int) {
        if row == movies.count - 1 && page < totalPages {
            page = page + 1
            service.fetchSearchMovie(string: query, page: 1)
        }
    }
    
    func searchFor(query: String) {
        if query.count > 3 {
            reset()
            self.query = query
            view?.startLoadingFeedback()
            service.fetchSearchMovie(string: query, page: 1)
        }
    }
    
    func goBack() {
        router.gobBack()
    }
    
    private func reset() {
        totalPages = 1
        page = 1
        movies = []
    }
}

extension SearchMoviesPresenter: SearchMoviesServiceOutput {
    func fetchSearcMoviesSucceeded(output: SearchOutput) {
        totalPages = output.totalPages
        output.results.forEach { movies.append(MovieModel(code: $0.id,
                                                          name: $0.title,
                                                          overview: $0.overview,
                                                          releaseDate: Date.fromString( $0.releaseDate),
                                                          posterPath: $0.posterPath,
                                                          genres: $0.genreIDS,
                                                          backdrop: $0.backdropPath)) }
        
        view?.stopLoadingFeedback()
        view?.updateMoviesList(movies: movies)
    }
    
    func fetchSearchMoviesFailed(message: String) {
        // TODO: treat error message
        view?.stopLoadingFeedback()
    }
}

