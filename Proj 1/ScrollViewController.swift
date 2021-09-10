//
//  ScrollViewController.swift
//  Proj 1
//
//  Created by Joshua Sylvester on 9/8/21.
//

import UIKit

// Scroll view code adapted from : https://medium.com/swlh/swift-5-how-to-programmatically-add-images-to-a-uiscrollview-ee5b97aa2e00
// Note that this was a programmtic implementation instead of storyboard. It just seemed easier to do it this way
class ScrollViewController: UIViewController{
    lazy var movies = [String]()
    var scrollView: UIScrollView!
    lazy var images = [UIImageView]()
    
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
        
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
            // Set the contentSize to 100 times the height of the phone's screen so that
            scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: UIScreen.main.bounds.height*100)
            view.addSubview(scrollView)
            
        for i in 0..<movies.count {
           var tempImage = UIImage(named: movies[i])
            images.append(UIImageView(image: tempImage))
            images[i].frame = CGRect(x: 100, y: ((tempImage?.size.height)! + 50)*CGFloat(i), width: (tempImage?.size.width)!, height: (tempImage?.size.height)!)
//              images[i].contentMode = .scaleAspectFill
              scrollView.addSubview(images[i])
            }
    }
    
}
