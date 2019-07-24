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
        }
    }
    
    var params: [String: String] {
        
        switch self {
        case .upcoming(let language, let page):
            return ["language": language,
                    "page": "\(page)"]
        case.movieDetail(_ ,let language):
            return ["language": language.type]
        default:
            return [:]
        }
    }
}
