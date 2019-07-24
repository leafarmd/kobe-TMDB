//
//  APISupportTypes.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 23/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation

extension API {
    
    enum Language: String {
        case enUS
        
        var type: String {
            switch  self {
            case .enUS:
                return "en-US"
            }
        }
    }
    
    enum Result<Success, Failure, Other> where Failure : Error {
        case success(Success)
        case failure(Failure)
        case other(Other)
    }
    
    enum RequestError: Error {
        case malformedURL
        case requestFailed
        case invalidData
        case decodingFailed
    }
    
    enum HttpMethod: String {
        case POST
        case GET
    }
    
    typealias RequestResult<T> = Result<T, RequestError, APIError>
    typealias CompletionCallback<T: Decodable> = (RequestResult<T>) -> Void
    
}
