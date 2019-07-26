//
//  UpcomingMoviesViewController.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 24/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

final class UpcomingMoviesViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private let presenter: UpcomingMoviesPresenter
    
    init(presenter: UpcomingMoviesPresenter) {
        self.presenter = presenter
        
        super.init(nibName: "UpcomingMoviesViewController", bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UpcomingMoviesTableViewCell.height
        
        tableView.register(UpcomingMoviesTableViewCell.nib, forCellReuseIdentifier: UpcomingMoviesTableViewCell.identifier)
    
        presenter.attachView(self)
    }
    @IBAction func searchTouched(_ sender: Any) {
        presenter.presentSearchMovies()
    }
}

extension UpcomingMoviesViewController: UpcomingMoviesView {
    func setDataSource(_ datasource: MoviesDataSource) {
        tableView.dataSource = datasource
        tableView.delegate = datasource
    }
    
    func setNavigationTitle(_ text: String) {
        labelTitle.text = "Upcoming Movies"
    }
    
    func updateMoviesList() {
        tableView.reloadData()
    }
    
    func startLoadingFeedback() {
        Loading.start()
    }
    
    func stopLoadingFeedback() {
        Loading.stop()
    }
    
    func presenterError(message: String) {
        showAlert(title: "Error", message: message)
    }
}
