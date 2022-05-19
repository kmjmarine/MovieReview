//
//  MovieReviewUITests.swift
//  MovieReviewUITests
//
//  Created by kmjmarine on 2022/05/12.
//

import XCTest

class MovieReviewUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app =  nil
    }
    
    func test_navigationBarTitle() {
        let existNavigationBar: Bool = app.navigationBars["영화 평점"].exists
        XCTAssertTrue(existNavigationBar)
    }
    
    func test_searchBar() {
        let existSearchBar: Bool = app.navigationBars["영화 평점"].searchFields["Search"].exists
        XCTAssertTrue(existSearchBar)
    }
    
    func test_cancelButton() {
        let navigationBar = app.navigationBars["영화 평점"]
        
        navigationBar
            .searchFields["Search"]
            .tap()
        
        let cancelButton: Bool = navigationBar.buttons["Cancel"].exists
        XCTAssertTrue(cancelButton)
    }
}
