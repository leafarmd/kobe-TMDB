//
//  MovieDetailRouter.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 25/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

final class MovieDetailRouter: MovieDetailRoutering {
    
    private let navigator: UINavigationController
    private let model: MovieModel
    
    init(navigator: UINavigationController, model: MovieModel) {
        self.navigator = navigator
        self.model = model
    }
    
    func makeViewController() -> UIViewController {
        let presenter = MovieDetailPresenter(model: model, router: self)
        let viewController = MovieDetailViewController(presenter: presenter)
        
        return viewController
    }
    
    func goBack() {
        navigator.popViewController(animated: true)
    }
}
