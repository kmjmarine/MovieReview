//
//  MovieDetailPresenter.swift
//  MovieReview
//
//  Created by kmjmarine on 2022/05/17.
//

import Foundation

protocol MovieDetailProtocol: AnyObject {
    func setViews(with movie: Movie)
}

final class MovieDetailPresenter {
    private weak var viewController: MovieDetailProtocol?
    
    private var movie: Movie
    
    init(
        viewController: MovieDetailProtocol,
        movie: Movie
    ) {
        self.viewController = viewController
        self.movie = movie
    }
    
    func viewDidLoad() {
        viewController?.setViews(with: movie)
    }
}
