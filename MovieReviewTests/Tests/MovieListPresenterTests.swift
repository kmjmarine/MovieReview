//
//  MovieListPresenterTests.swift
//  MovieReviewTests
//
//  Created by kmjmarine on 2022/05/19.
//

import XCTest
@testable import MovieReview

class MovieListPresenterTests: XCTestCase {
    var sut: MovieListPresenter!
    
    var viewController: MockMovieListViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    var movieSearchManager: MockMovieSearchManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockMovieListViewController()
        userDefaultsManager = MockUserDefaultsManager()
        movieSearchManager = MockMovieSearchManager()
        
        sut = MovieListPresenter(
            viewController: viewController,
            userDefaultsManager: userDefaultsManager,
            movieSearchManager: movieSearchManager
        )
    }
    
    override func tearDown() {
        sut = nil
        
        viewController = nil
        userDefaultsManager = nil
        movieSearchManager = nil
        
        super.tearDown()
    }
    
    func test_searchBarDidiChange_Reqeust_Suecess() {
        movieSearchManager.needToSuccessRequest = true
        sut.searchBar(UISearchBar(), textDidChange: "")
        
        XCTAssertTrue(viewController.isCalledUpdateSearchTableView, "updateSearchTableView is run")
    }
    
    func test_searchBarDidiChange_Reqeust_Fail() {
        movieSearchManager.needToSuccessRequest = false
        sut.searchBar(UISearchBar(), textDidChange: "")
        
        XCTAssertFalse(viewController.isCalledUpdateSearchTableView, "updateSearchTableView is not run")
    }
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupSearchBar)
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_viewWillAppear() {
        sut.viewWillAppear()
        
        XCTAssertTrue(userDefaultsManager.isCalledGetMovies)
        XCTAssertTrue(viewController.isCalledIpdateCollectionView)
    }
    
    func test_searchBarTextDidBeginEditing() {
        sut.searchBarTextDidBeginEditing(UISearchBar())
        
        XCTAssertTrue(viewController.isCalledUpdateSearchTableView)
    }
    
    func test_searchBarCancelButtonClicked() {
        sut.searchBarCancelButtonClicked(UISearchBar())
        
        XCTAssertTrue(viewController.isCalledUpdateSearchTableView)
    }
}
