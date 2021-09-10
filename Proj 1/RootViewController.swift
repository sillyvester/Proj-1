//
//  ViewController.swift
//  Proj 1
//
//  Created by Joshua Sylvester on 9/7/21.
//

// STILL NEED:
// Picker delegate
// Segmented Control
// Scroll view
// Use if lets
// Use lazy instantiation
// Landscape mode


import UIKit

extension WelcomeViewController {
    func updateFeedbackText(withText text: String) {
        print("Updating like or not text field")
        self.feedbackLabel.text = text
    }
}

class WelcomeViewController: UIViewController, RateTheAppViewControllerDelegate {
    
    // MARK: For Timer
    lazy var timer = Timer()
    lazy var timeInterval = 1
    lazy var runCount = 0
    lazy var greetingStringIndex = 0
    lazy var arrayOfTexts = ["Welcome to the App",
                        "Good Morning Dr. Larson",
                        "Hello Dr. Larson",
                        "Larson is the Best",
                        "Larson is great"]
        
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var imageSwitch: UISwitch!
    @IBOutlet weak var rootImage: UIImageView!
    @IBOutlet weak var feedbackButton: UIButton!
    @IBOutlet weak var feedbackLabel: UILabel!
    
    var delegate: RateTheAppViewControllerDelegate?
    
    @IBAction func onFeedbackButtonPressed(_ sender: Any) {
        print("Feedback Button Press")
        if let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RatingVC") as? RateTheAppViewController{
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
            
        }
    }
    
    
    @IBAction func imageSwitchPressed(_ sender: UISwitch) {
        if imageSwitch.isOn {
            self.changeImage(filename: "image1.jpeg")
        }
        else {
            self.changeImage(filename: "image2.jpeg")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(timeInterval),
                                     target: self,
                                     selector: #selector(startTimer),
                                     userInfo: nil,
                                     repeats: true)
            
        
        self.startTimer()
        self.initImage()
    }
    
    
    func changeImage(filename: String){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.rootImage.image = UIImage(named: filename)
        }
    }
    
    func initImage(){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.rootImage.image = UIImage(named: "image1.jpeg")
        }
    }

    
    @objc func startTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if (self.runCount % 5 == 0){
                if (self.greetingStringIndex == self.arrayOfTexts.count){
                    self.greetingStringIndex = 0
                }
                self.topLabel.text = self.arrayOfTexts[self.greetingStringIndex]
                self.greetingStringIndex += 1
            }
        }
        runCount += 1
    }


}

