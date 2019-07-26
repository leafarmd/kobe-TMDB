//
//  APISupportTypes.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 23/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation
import UIKit

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
        
        var message: String {
            switch self {
                case .malformedURL:
                    return "error with URL requested"
                case .requestFailed:
                    return "error with request"
                case .invalidData:
                    return "invalid data"
                case .decodingFailed:
                    return "data decode failed"
            }
        }
    }
    
    enum HttpMethod: String {
        case POST
        case GET
    }
    
    typealias RequestResult<T> = Result<T, RequestError, APIError>
    typealias RequestImageResult = (Result<UIImage, RequestError, APIError>) -> Void
    typealias CompletionCallback<T: Decodable> = (RequestResult<T>) -> Void
}
