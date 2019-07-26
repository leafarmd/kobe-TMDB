//
//  MovieSearchProtocols.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 25/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

protocol SearchMoviesView: class {
    func updateMoviesList(movies: [MovieModel])
    func startLoadingFeedback()
    func stopLoadingFeedback()
}

protocol SearchMoviesServiceInput: class {
    var output: SearchMoviesServiceOutput? { get }
    func fetchSearchMovie(string: String, page: Int)
}

protocol SearchMoviesServiceOutput: class {
    func fetchSearcMoviesSucceeded(output: SearchOutput)
    func fetchSearchMoviesFailed(message: String)
}

protocol SearchMoviesRoutering: class {
    func makeViewController() -> UIViewController
    func gobBack()
}
