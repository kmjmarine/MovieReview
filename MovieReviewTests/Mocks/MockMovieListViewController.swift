//
//  MockMovieListViewController.swift
//  MovieReviewTests
//
//  Created by kmjmarine on 2022/05/19.
//

import Foundation
@testable import MovieReview

final class MockMovieListViewController: MovieListProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledSetupSearchBar = false
    var isCalledSetupViews = false
    var isCalledUpdateSearchTableView = false
    var isCalledPushToMovieViewController = false
    var isCalledIpdateCollectionView = false
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func setupSearchBar() {
        isCalledSetupSearchBar = true
    }
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func updateSearchTableView(isHidden: Bool) {
        isCalledUpdateSearchTableView = true
    }
    
    func pushToMovieViewController(with movie: Movie) {
        isCalledPushToMovieViewController = true
    }
    
    func updateCollectionView() {
        isCalledIpdateCollectionView = true
    }
}
