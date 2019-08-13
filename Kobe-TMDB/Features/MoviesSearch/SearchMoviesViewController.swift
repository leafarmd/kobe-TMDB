//
//  SearchMoviesViewController.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 24/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

final class SearchMoviesViewController: UIViewController {
    
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    private let presenter: SearchMoviesPresenter
    var movies: [MovieModel] = []
    
    
    init(presenter: SearchMoviesPresenter) {
        self.presenter = presenter
        
        super.init(nibName: "SearchMoviesViewController", bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textInput.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UpcomingMoviesTableViewCell.height
        tableView.register(UpcomingMoviesTableViewCell.nib, forCellReuseIdentifier: UpcomingMoviesTableViewCell.identifier)
        
        presenter.attachView(self)
        
        setupKeyboardButton(with: "OK")
    }
    
    private func setupKeyboardButton(with title: String) {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: title, style: .done, target: self, action: #selector(hideKeyBoard))
        
        let items = [flexSpace, done, flexSpace]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        textInput.inputAccessoryView = doneToolbar
        textInput.reloadInputViews()
    }
    
    @objc private func hideKeyBoard(sender: UITapGestureRecognizer? = nil) {
        view.endEditing(true)
    }
    @IBAction private func gobackTouched(_ sender: Any) {
        presenter.goBack()
    }
}

extension SearchMoviesViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            presenter.searchFor(query: "\(text)\(string)")
        }
        return true
    }
}

extension SearchMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectedMovie(movie: movies[indexPath.row])
        hideKeyBoard()
    }
}

extension SearchMoviesViewController: UITableViewDataSource {
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

extension SearchMoviesViewController: SearchMoviesView {
    
    func updateMoviesList(movies: [MovieModel]) {
    
        self.movies = movies
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
