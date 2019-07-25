//
//  UpcomingMoviesProtocols.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 24/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

protocol UpcomingMoviesView: class {
    func setNavigationTitle(_ text: String)
    func updateMoviesList()
    func startLoadingFeedback()
    func stopLoadingFeedback()
    func setDataSource(_ datasource: MoviesDataSource)
}

protocol UpcomingMoviesServiceInput: class {
    var output: UpcomingMoviesServiceOutput? { get }
    func fetchUpcomingMovies(page number: Int)
}

protocol UpcomingMoviesServiceOutput: class {
    func fetchUpcomingMoviesSucceeded(output: UpcomingMoviesOutput)
    func fetchUpcomingMoviesFailed(message: String)
}

protocol UpcomingMoviesRoutering: class {
    func makeViewController() -> UIViewController
}

protocol UpcomingMoviesCellView: class {
    func setTitle(_ text: String)
    func setImage(_ image: UIImage)
    func setGenres(_ text: String)
    func setDate(_ text: String)
}

protocol MoviesDataSourceDelegate: class {
    func fetchNextPage(page: Int)
    func fetchUpcomingMoviesSucceeded()
    func fetchUpcomingMoviesFailed(message: String)
}
