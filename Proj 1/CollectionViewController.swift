//
//  CollectionViewController.swift
//  Proj 1
//
//  Created by Joshua Sylvester on 9/8/21.
//

import UIKit

private let reuseIdentifier = "CollectCell"

class CollectionViewController: UICollectionViewController{
    
    lazy var movies = [String]()
    lazy var genreDictionary = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "movies", ofType: "plist")!
        let dict = NSDictionary(contentsOfFile: path)
        let genresDict = dict?["genres"] as! NSDictionary
        let genres = genresDict.allKeys as! [String]
        for genre in genres {
            let tempGenreArr = genresDict.object(forKey: genre) as! [String]
            movies += tempGenreArr
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewCell {

            if let name = self.movies[indexPath.row] as? String{
                cell.imageView.image = UIImage(named: name)
            }

            return cell
        }else{
            fatalError("Could not dequeue cell")
        }
    }
}
