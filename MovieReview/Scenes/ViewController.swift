//
//  ViewController.swift
//  MovieReview
//
//  Created by kmjmarine on 2022/05/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieSearchManager().request(from: "Starwars") { movies in
            print(movies)
        }
    }

}