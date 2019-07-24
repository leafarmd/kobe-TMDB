//
//  UpcomingMoviesModel.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 24/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

struct UpcomingMoviesModel {
    let movies: [MoviesModel]
    let totalPages: Int
}

struct MoviesModel {
    let code: Int
    let name: String
    let releaseDate: String
    let posterPath: String?
}
