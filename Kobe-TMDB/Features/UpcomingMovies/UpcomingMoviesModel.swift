//
//  UpcomingMoviesModel.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 24/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation

struct UpcomingMoviesModel {
    let movies: [MovieModel]
    let totalPages: Int
}

struct MovieModel {
    let code: Int
    let name: String
    let overview: String
    let releaseDate: Date?
    let posterPath: String?
    let genres: [Int]
}
