//
//  APIError.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 23/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation

struct APIError: Decodable {
    let message: String?
    let code: String?
    
    enum CodingKeys: String, CodingKey {
        case message = "status_message"
        case code = "status_code"
    }
}

