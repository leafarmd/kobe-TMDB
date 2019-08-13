//
//  GenresOutput.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 25/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation

struct GenresOutput: Decodable {
    let genres: [GenreOutput]
}
