//
//  RandomMovieViewController.swift
//  Proj 1
//
//  Created by Joshua Sylvester on 9/9/21.
//

import UIKit


class RandomMovieViewController: UIViewController {
    var genreName: String = ""
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let path = Bundle.main.path(forResource: "movies", ofType: "plist")!
        if let dict = NSDictionary(contentsOfFile: path),
           let genresDict = dict["genres"] as? NSDictionary,
           let movies = genresDict.object(forKey: genreName) as? [String],
           let internalMovieName = movies.randomElement() {
            print(genreName)
            print(movies)
            print(dict)
            movieName.text = internalMovieName
            moviePoster.image = UIImage(named: internalMovieName)
        }
    }
}

    
