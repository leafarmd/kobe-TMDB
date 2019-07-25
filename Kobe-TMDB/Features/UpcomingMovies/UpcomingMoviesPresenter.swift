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
    private let dataSource: MoviesDataSource
    
    init() {
        self.dataSource = MoviesDataSource()
        dataSource.delegate = self
        service.output = dataSource
    }
    
    func attachView(_ view: UpcomingMoviesView) {
        self.view = view
        
        view.setNavigationTitle("Upcoming Movies")
        view.setDataSource(dataSource)
        view.startLoadingFeedback()
        service.fetchUpcomingMovies(page: 1)
    }
    
    func viewWillAppear() {
        
    }
    
    func fetchUpcomingMovies(page: Int) {
        service.fetchUpcomingMovies(page: page)
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
    }
}
