//
//  APIEndpoints.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 23/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation

enum APIEndpoint {
    case upcoming(language: String, page: Int)
    case genre
    case movieDetail(_ id: Int, language: API.Language)
    case searchMovie(query: String, language: String, page: Int)
}

extension APIEndpoint {
    
    var url: String {
        
        switch self {
        case .upcoming:
            return "movie/upcoming"
        case .genre:
            return "genre/movie/list"
        case .movieDetail(let id, _):
            return "movie/\(id)"
        case .searchMovie:
            return "search/movie"
        }
    }
    
    var params: [String: String] {
        
        switch self {
        case .upcoming(let language, let page):
            return ["language": language, "page": "\(page)"]
        case .movieDetail(_ ,let language):
            return ["language": language.type]
        case .searchMovie(let query, let language, let page):
            return ["query": query, "language": language, "page": "\(page)", "include_adult": "false"]
        default:
            return [:]
        }
    }
    
    public enum ImageSize: String {
        case w45
        case w92
        case w154
        case w185
        case w300
        case w342
        case w500
        case h632
        case w780
        case w1280
        case original
    }
    
}
