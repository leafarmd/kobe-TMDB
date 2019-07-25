//
//  UpcomingMovieCellPresenter.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 24/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

final class UpcomingMovieCellPresenter {
    
    private let model: MovieModel
    weak var view: UpcomingMoviesCellView?
    
    init(model: MovieModel) {
        self.model = model
    }
    
    func attachView(_ view: UpcomingMoviesCellView) {
        self.view = view
        
        setupView()
    }
    
    func setupView() {
        view?.setTitle(model.name)
        view?.setGenres(model.overview)
        
        let date = model.releaseDate?.toString ?? "TBA"
        view?.setDate("Release Date: \(date)" )
        
        if let genres = TMDBHolder.shared.genres {
            var movieGenres: [String] = []
            model.genres.forEach {
                if let genre = genres.genres[$0] {
                    movieGenres.append(genre)
                }
            }
            view?.setGenres(movieGenres.map{ $0 }.joined(separator: ", "))
        }
        
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
