//
//  UpcomingMoviesViewController.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 24/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

class UpcomingMoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let presenter: UpcomingMoviesPresenter
    var movies: [MoviesModel] = []
    
    init(presenter: UpcomingMoviesPresenter) {
        self.presenter = presenter
        
        super.init(nibName: "UpcomingMoviesViewController", bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UpcomingMoviesTableViewCell.nib, forCellReuseIdentifier: UpcomingMoviesTableViewCell.identifier)
    
        presenter.attachView(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }
}

extension UpcomingMoviesViewController: UITableViewDelegate {
    
}

extension UpcomingMoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingMoviesTableViewCell.identifier) as! UpcomingMoviesTableViewCell
        
            let presenter = UpcomingMovieCellPresenter(model: movies[indexPath.row])
            cell.attachPresenter(presenter)
        
        self.presenter.actualRow(indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UpcomingMoviesTableViewCell.height
    }
}

extension UpcomingMoviesViewController: UpcomingMoviesView {
    func setNavigationTitle(_ text: String) {
        navigationItem.title = "Upcoming Movies"
    }
    
    func setMoviesList(_ list: [MoviesModel]) {
        movies.append(contentsOf: list)
        
        tableView.reloadData()
    }
    
    func startLoadingFeedback() {
        Loading.start()
    }
    
    func stopLoadingFeedback() {
        Loading.stop()
    }
    
}
