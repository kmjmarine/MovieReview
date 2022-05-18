//
//  Movie.swift
//  MovieReview
//
//  Created by kmjmarine on 2022/05/16.
//

import Foundation

struct Movie: Codable {
    let title: String
    private let image: String
    let userRating: String
    let actor: String
    let director: String
    let pubDate: String
    
    var imageURL: URL? { URL(string: image) }
    
    init(
        title: String,
        imageURL: String,
        userRating: String,
        actor: String,
        director: String,
        pubDate: String
    ) {
        self.title = title
        self.image = imageURL
        self.userRating = userRating
        self.actor = actor
        self.director = director
        self.pubDate = pubDate
    }
}
