//
//  GenresProtocol.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 25/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

protocol GenresServiceInput: class {
    var output: GenresServiceOutput? { get }
    func fetchGenres()
}

protocol GenresServiceOutput: class {
    func fetchGenresSucceeded(output: [GenreOutput])
    func fetchGenresFailed(message: String)
}

protocol GenreDelegate:class {
    func fetchGenresSucceeded(model: GenreModel)
    func fetchGenresFailed(message: String)
}
