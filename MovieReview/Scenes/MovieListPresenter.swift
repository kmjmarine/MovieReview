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
}

final class MovieListPresenter: NSObject {
    private weak var viewController: MovieListProtocol?
    
    init(viewController: MovieListProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController?.setupNavigationBar()
        viewController?.setupSearchBar()
    }
}

extension MovieListPresenter: UISearchBarDelegate {}
