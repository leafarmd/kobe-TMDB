//
//  MoviesDataSource.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 24/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

final class MoviesDataSource: NSObject {
    
    private var movies: [MovieModel] = []
    
    weak var delegate: MoviesDataSourceDelegate?
    private var totalPages = 1
    private var page = 1
    
    func actualRow(_ row: Int) {
        if row == movies.count - 1 && page < totalPages {
            page = page + 1
            delegate?.fetchNextPage(page: page)
        }
    }
}

extension MoviesDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedMovie(movie: movies[indexPath.row])
    }
}

extension MoviesDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingMoviesTableViewCell.identifier) as! UpcomingMoviesTableViewCell
        
        let presenter = UpcomingMovieCellPresenter(model: movies[indexPath.row])
        cell.attachPresenter(presenter)
        
        actualRow(indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UpcomingMoviesTableViewCell.height
    }
}

extension MoviesDataSource: UpcomingMoviesServiceOutput {
    
    func fetchUpcomingMoviesSucceeded(output: UpcomingMoviesOutput) {
        totalPages = output.totalPages
        output.results.forEach { movies.append(MovieModel(code: $0.id,
                                                           name: $0.title,
                                                           overview: $0.overview,
                                                           releaseDate: Date.fromString( $0.releaseDate),
                                                           posterPath: $0.posterPath,
                                                           genres: $0.genreIDS,
                                                           backdrop: $0.backdropPath)) }
        
        delegate?.fetchUpcomingMoviesSucceeded()
    }
    
    func fetchUpcomingMoviesFailed(message: String) {
        delegate?.fetchUpcomingMoviesFailed(message: message)
    }
}

