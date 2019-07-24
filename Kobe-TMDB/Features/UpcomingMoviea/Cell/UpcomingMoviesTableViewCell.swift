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
    static let height: CGFloat = 200
    
    func setup() {
        
    }
}
