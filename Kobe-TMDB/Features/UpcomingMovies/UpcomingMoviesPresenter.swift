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
    private let interactor = GenreInteractor()
    private let dataSource: MoviesDataSource
    private let router: UpcomingMoviesRouter
    
    init(router: UpcomingMoviesRouter) {
        self.router = router
        self.dataSource = MoviesDataSource()
        dataSource.delegate = self
        service.output = dataSource
        interactor.delegate = self
    }
    
    func attachView(_ view: UpcomingMoviesView) {
        self.view = view
        
        view.setNavigationTitle("Upcoming Movies")
        view.setDataSource(dataSource)
        view.startLoadingFeedback()
        interactor.fetchData()
    }
    
    func fetchUpcomingMovies(page: Int) {
        view?.startLoadingFeedback()
        service.fetchUpcomingMovies(page: page)
    }
    
    func presentSearchMovies() {
        router.navigateToSearchMovies()
    }
}
extension UpcomingMoviesPresenter: MoviesDataSourceDelegate {
    func fetchNextPage(page: Int) {
        view?.startLoadingFeedback()
        fetchUpcomingMovies(page: page)
    }
    
    func fetchUpcomingMoviesSucceeded() {
        view?.stopLoadingFeedback()
        view?.updateMoviesList()
    }
    
    func fetchUpcomingMoviesFailed(message: String) {
        view?.stopLoadingFeedback()
        view?.presenterError(message: message)
    }
    
    func selectedMovie(movie: MovieModel) {
        router.navigateToMovieDetail(model: movie)
    }
}

extension UpcomingMoviesPresenter: GenreDelegate {
    func fetchGenresSucceeded(model: GenreModel) {
        service.fetchUpcomingMovies(page: 1)
        TMDBHolder.shared.genres = model
    }
    
    func fetchGenresFailed(message: String) {
        service.fetchUpcomingMovies(page: 1)
    }
    
    
}
