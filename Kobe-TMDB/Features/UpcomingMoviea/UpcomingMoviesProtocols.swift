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
    func setMoviesList(_ list: [MoviesModel])
    func startLoadingFeedback()
    func stopLoadingFeedback()
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
}
