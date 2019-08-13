//
//  MovieDetailPresenter.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 25/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

final class MovieDetailPresenter {
    
    private let model: MovieModel
    private let router: MovieDetailRouter
    weak var view: MovieDetailView?
    
    init(model: MovieModel, router: MovieDetailRouter) {
        self.model = model
        self.router = router
    }
    
    func attachView(_ view: MovieDetailView) {
        self.view = view
        
        setupView()
    }
    
    func goBack() {
     router.goBack()
    }
    
    private func setupView() {
        view?.setTitle(model.name)
        view?.setOverview(model.overview)
        
        let date = model.releaseDate?.toString ?? "TBA"
        view?.setReleaseDate("Release Date: \(date)" )
        
        if let genres = TMDBHolder.shared.genres {
            var movieGenres: [String] = []
            model.genres.forEach {
                if let genre = genres.genres[$0] {
                    movieGenres.append(genre)
                }
            }
            view?.setGenre(movieGenres.map{ $0 }.joined(separator: ", "))
        }
        
        if let url = model.backdrop {
            API.loadImage(from: url, size: .w780) { [weak self] response in
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
