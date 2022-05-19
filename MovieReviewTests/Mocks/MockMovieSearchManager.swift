//
//  MockMovieSearchManager.swift
//  MovieReviewTests
//
//  Created by kmjmarine on 2022/05/19.
//

import Foundation
@testable import MovieReview

final class MockMovieSearchManager: MovieSearchManagerProtocol {
    var isCalledRequest = false
    var needToSuccessRequest = false
    
    func request(
        from keyword: String,
        completionHandler: @escaping ([Movie]) -> Void
    ) {
        isCalledRequest = true
        
        if needToSuccessRequest {
            completionHandler([ ])
        }
    }
}
