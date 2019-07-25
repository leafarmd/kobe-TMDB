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
    
    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func makeViewController() -> UIViewController {
        let presenter = UpcomingMoviesPresenter()
        let viewController = UpcomingMoviesViewController(presenter: presenter)
        
        return viewController
    }
}
