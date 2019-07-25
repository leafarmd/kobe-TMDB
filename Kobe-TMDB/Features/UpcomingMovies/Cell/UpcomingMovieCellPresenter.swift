//
//  UpcomingMovieCellPresenter.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 24/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

final class UpcomingMovieCellPresenter {
    
    private let model: MoviesModel
    weak var view: UpcomingMoviesCellView?
    
    init(model: MoviesModel) {
        self.model = model
    }
    
    func attachView(_ view: UpcomingMoviesCellView) {
        self.view = view
        
        setupView()
    }
    
    func setupView() {
        view?.setTitle(model.name)
        
        if let url = model.posterPath {
            API.loadImage(from: url) { [weak self] response in
                switch response {
                case .success(let image):
                    self?.view?.setImage(image)
                default:
                    break
                }
            }
        }
    }
    
}
