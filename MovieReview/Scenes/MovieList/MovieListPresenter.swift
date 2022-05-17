//
//  MovieListPresenter.swift
//  MovieReview
//
//  Created by kmjmarine on 2022/05/16.
//

import UIKit

protocol MovieListProtocol: AnyObject {
    func setupNavigationBar()
    func setupSearchBar()
    func setupViews()
    func updateSearchTableView(isHidden: Bool)
}

final class MovieListPresenter: NSObject {
    private weak var viewController: MovieListProtocol?
    
    private let movieSearchManager: MovieSearchManagerProtocol
    
    private  var likedMovie: [Movie] = [
        Movie(title: "Starwars", imageURL: "", userRating: "5.0", actor: "ABC", director: "ABC", pubDate: "2022"),
        Movie(title: "Starwars", imageURL: "", userRating: "5.0", actor: "ABC", director: "ABC", pubDate: "2022"),
        Movie(title: "Starwars", imageURL: "", userRating: "5.0", actor: "ABC", director: "ABC", pubDate: "2022")
    ]
    
    init(
        viewController: MovieListProtocol,
        movieSearchManager: MovieSearchManagerProtocol = MovieSearchManager()
    ) {
        self.viewController = viewController
        self.movieSearchManager = movieSearchManager
    }
    
    func viewDidLoad() {
        viewController?.setupNavigationBar()
        viewController?.setupSearchBar()
        viewController?.setupViews()
    }
}

extension MovieListPresenter: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        viewController?.updateSearchTableView(isHidden: false)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewController?.updateSearchTableView(isHidden: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        movieSearchManager.request(from: searchText) { movies in
            print(movies)
        }
    }
}

extension MovieListPresenter: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let spacing: CGFloat = 16.0
        let width: CGFloat = (collectionView.frame.width - spacing * 3) / 2
        return CGSize(width: width, height: 210.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 16.0
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}

extension MovieListPresenter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return likedMovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MovieListCollectionViewCell.identifier,
            for: indexPath
        ) as? MovieListCollectionViewCell
        
        let movie = likedMovie[indexPath.item]
        cell?.update(movie)
        
        
        return cell ?? UICollectionViewCell()
    }
}

extension MovieListPresenter: UITableViewDelegate {}

extension MovieListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath)"
        
        return cell
    }
}
