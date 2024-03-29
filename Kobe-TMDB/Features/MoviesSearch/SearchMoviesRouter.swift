//
//  SearchMoviesRouter.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 25/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

final class SearchMovieRouter: SearchMoviesRoutering {
    
    private let navigator: UINavigationController
    private var router: MovieDetailRouter?
    
    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func makeViewController() -> UIViewController {
        let presenter = SearchMoviesPresenter(router: self)
        let viewController = SearchMoviesViewController(presenter: presenter)
        
        return viewController
    }
    
    func gobBack() {
        navigator.popViewController(animated: true)
    }
    
    func navigateToMovieDetail(model: MovieModel) {
        let router = MovieDetailRouter(navigator: navigator, model: model)
        
        navigator.pushViewController(router.makeViewController(), animated: true)
        
        self.router = router
    }
}
