//
//  UpcomingMoviesPresenter.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 24/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

final class UpcomingMoviesPresenter {
    
    private weak var view: UpcomingMoviesView?
    private let service = UpcomingMoviesService()
    private var movies: [MoviesModel] = []
    private var totalPages = 1
    private var page = 1
    
    func attachView(_ view: UpcomingMoviesView) {
        self.view = view
    }
    
    func viewWillAppear() {
        service.output = self
        view?.startLoadingFeedback()
        service.fetchUpcomingMovies(page: page)
    }
    
    func actualRow(_ row: Int) {
        if row == movies.count - 1 {
            page = page + 1
            view?.startLoadingFeedback()
            service.fetchUpcomingMovies(page: page)
        }
    }
}

extension UpcomingMoviesPresenter: UpcomingMoviesServiceOutput {
    
    func fetchUpcomingMoviesSucceeded(output: UpcomingMoviesOutput) {
        totalPages = output.totalPages 
        output.results.forEach { movies.append(MoviesModel(code: $0.id, name: $0.title, releaseDate: $0.releaseDate, posterPath: $0.backdropPath)) }
        movies.sort(by: { $0.releaseDate < $1.releaseDate })
        view?.setMoviesList(movies)
        view?.stopLoadingFeedback()
    }
    
    func fetchUpcomingMoviesFailed(message: String) {
        view?.stopLoadingFeedback()
    }
}
