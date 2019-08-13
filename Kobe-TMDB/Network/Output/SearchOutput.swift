//
//  SearchOutput.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 26/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation

struct SearchOutput: Decodable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [SearchResultOutput]
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

struct SearchResultOutput: Decodable {
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
        case backdropPath = "backdrop_path"
        case adult
        case overview
        case releaseDate = "release_date"
    }
}
