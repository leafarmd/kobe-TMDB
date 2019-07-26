//
//  TMDBHolder.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 25/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

final class TMDBHolder {
    
    static private(set) var shared = TMDBHolder()
    
    private init() {}
    
    var genres: GenreModel?
    var cachedImgae: [String: UIImage] = [:]
    
}

extension TMDBHolder {
    
    static func invalidate() {
        shared = TMDBHolder()
    }
}
