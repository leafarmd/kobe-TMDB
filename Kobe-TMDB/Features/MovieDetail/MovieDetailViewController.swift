//
//  MovieDetailViewController.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 25/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

final class MovieDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var labelGenres: UILabel!
    @IBOutlet weak var labelReleaseDate: UILabel!
    @IBOutlet weak var labelOverview: UILabel!
    
    private let presenter: MovieDetailPresenter
    
    init(presenter: MovieDetailPresenter) {
        self.presenter = presenter
        
        super.init(nibName: "MovieDetailViewController", bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {return nil}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.attachView(self)
    }
    @IBAction func backTouched(_ sender: Any) {
        presenter.goBack()
    }
}

extension MovieDetailViewController: MovieDetailView {
    func setTitle(_ text: String) {
        labelText.text = text
    }
    
    func setReleaseDate(_ text: String) {
        labelReleaseDate.text = text
    }
    
    func setOverview(_ text: String) {
        labelOverview.text = text
    }
    
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
    
    func setGenre(_ text: String) {
        labelGenres.text = text
    }
}
