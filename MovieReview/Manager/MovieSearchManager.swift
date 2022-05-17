//
//  MovieSearchManager.swift
//  MovieReview
//
//  Created by kmjmarine on 2022/05/16.
//

import Foundation
import Alamofire

protocol MovieSearchManagerProtocol {
    func request(from keyword: String, completionHandler: @escaping([Movie]) -> Void)
}

struct MovieSearchManager: MovieSearchManagerProtocol {
    func request(from keyword: String, completionHandler: @escaping([Movie]) -> Void) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/movie.json") else { return }
        
        let parameters = MovieSearchRequestModel(query: keyword)
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id" : "YFZn4OE569U0SPwcG8XS",
            "X-Naver-Client-Secret" : "_9hmNuGhH7"
        ]
        
        AF.request(
            url,
            method: .get,
            parameters: parameters,
            headers: headers
        )
        .responseDecodable(of: MovieSearchResponseModel.self) { response in
            switch response.result {
            case .success(let result):
                completionHandler(result.items)
            case .failure(let error):
                print(error)
            }
        }
        .resume()
    }
}
