//
//  UpcomingMoviesOutput.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 23/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation

struct UpcomingMoviesOutput: Decodable {
    let page: Int
    let results: [ResultOutput]
    let totalResults: Int
    let dates: DatesOutput
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalResults = "total_results"
        case dates
        case totalPages = "total_pages"
    }
}

struct ResultOutput: Decodable {
    let voteCount: Int
    let id: Int
    let video: Bool
    let voteAverage: Double
    let title: String
    let popularity: Double
    let posterPath: String?
    let originalLanguage: String
    let originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String?
    let adult: Bool
    let overview: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id
        case video
        case voteAverage = "vote_average"
        case title
        case popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop path"
        case adult
        case overview
        case releaseDate = "release_date"
    }
}

struct DatesOutput: Decodable {
    let minimum: String
    let maximum: String
}




