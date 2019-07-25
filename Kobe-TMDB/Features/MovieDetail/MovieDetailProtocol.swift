//
//  MovieDetailProtocol.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 25/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

protocol MovieDetailView: class {
    func setTitle(_ text: String)
    func setReleaseDate(_ text: String)
    func setOverview(_ text: String)
    func setImage(_ image: UIImage)
    func setGenre(_ text: String)
}

protocol MovieDetailRoutering: class {
    func makeViewController() -> UIViewController
    func goBack()
}

