//
//  GenreDataSource.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 25/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

final class GenreInteractor {
    var genres: [GenreModel] = []
    private let service = GenresService()
    weak var delegate: GenreDelegate?
    
    init() {
        service.output = self
    }
    
    func fetchData() {
        service.fetchGenres()
    }
}

extension GenreInteractor: GenresServiceOutput {
    
    func fetchGenresSucceeded(output: [GenreOutput]) {
        var dict: [Int: String] = [:]
        output.forEach{ dict[$0.id] = $0.name }
        delegate?.fetchGenresSucceeded(model: GenreModel(genres: dict))
    }
    
    func fetchGenresFailed(message: String) {
        delegate?.fetchGenresFailed(message: message)
    }
}
