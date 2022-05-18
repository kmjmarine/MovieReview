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
}
