//
//  ViewController.swift
//  Proj 1
//
//  Created by Joshua Sylvester on 9/7/21.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: For Timer
    var timer: Timer?
    var timeInterval = 1
    var runCount = 0
    var greetingStringIndex = 0
    var arrayOfTexts = ["Welcome to the App",
                        "Good Morning Dr. Larson",
                        "Hello Dr. Larson",
                        "Larson is the Best",
                        "Larson is great"]
    
    @IBOutlet weak var topLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(timeInterval),
                                     target: self,
                                     selector: #selector(startTimer),
                                     userInfo: nil,
                                     repeats: true)
        
        self.startTimer()
//        self.initStepper()
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
    
    
//    // MARK: For Stepper
//    var curRating = 0
//    @IBOutlet weak var ratingStepper: UIStepper!
//    @IBOutlet weak var ratingLabel: UILabel!

    
//    @IBAction func stepperValueChanged(_ sender: UIStepper) {
//        let newRating = Int(sender.value)
//        if (newRating > 5){
//            self.curRating = 5
//        }else{
//            self.curRating = Int(sender.value)
//        }
//        updateTimer()
//    }
    
//    func initStepper(){
//        ratingStepper.wraps = true
//        ratingStepper.autorepeat = true
//        ratingStepper.maximumValue = 5
//    }
//
//    func updateTimer(){
//        DispatchQueue.main.asyncAfter(deadline: .now()) {
//            self.ratingLabel.text = "Rating: "+String(self.curRating)+"/5"
//        }
//    }


}

