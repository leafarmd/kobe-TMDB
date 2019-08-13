//
//  UpcomingMoviesRouter.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 24/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

final class UpcomingMoviesRouter: UpcomingMoviesRoutering {
    
    private let navigator: UINavigationController
    var router: MovieDetailRouter?
    var searchRouter: SearchMovieRouter?
    
    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func makeViewController() -> UIViewController {
        let presenter = UpcomingMoviesPresenter(router: self)
        let viewController = UpcomingMoviesViewController(presenter: presenter)
        
        return viewController
    }
    
    func navigateToMovieDetail(model: MovieModel) {
        let router = MovieDetailRouter(navigator: navigator, model: model)
        
        navigator.pushViewController(router.makeViewController(), animated: true)
        
        self.router = router
    }
    
    func navigateToSearchMovies() {
        let router = SearchMovieRouter(navigator: navigator)
        
        navigator.pushViewController(router.makeViewController(), animated: true)
        
        searchRouter = router
    }
}

