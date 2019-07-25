//
//  UpcomingMoviesTableViewCell.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 24/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

class UpcomingMoviesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewBackdrop: UIImageView!
    
    static let identifier = "upcomingMovies"
    static let nib = UINib(nibName: "UpcomingMoviesTableViewCell", bundle: nil)
    static let height: CGFloat = 300
    var presenter: UpcomingMovieCellPresenter?
    
    func attachPresenter(_ presenter: UpcomingMovieCellPresenter) {
        self.presenter = presenter
        presenter.attachView(self)
    }
}

extension UpcomingMoviesTableViewCell: UpcomingMoviesCellView {
    func setTitle(_ text: String) {
        labelTitle.text = text
    }
    
    func setImage(_ image: UIImage) {
        imageViewBackdrop.image = image
        
        layoutSubviews()
    }
}
