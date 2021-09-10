//
//  RateTheAppViewController.swift
//  Proj 1
//
//  Created by Eric Miao on 9/9/21.
//

import UIKit


protocol RateTheAppViewControllerDelegate: AnyObject {
    func updateFeedbackText(withText text: String)
}


class RateTheAppViewController: UIViewController {
    
    var delegate: RateTheAppViewControllerDelegate?

    @IBOutlet weak var currentRatingLabel: UILabel!
    @IBOutlet weak var ratingStepper: UIStepper!
    @IBOutlet weak var ratingSlider: UISlider!
    
    lazy var curRating = 0
    
    
    func initStepper(){
        ratingStepper.wraps = false
        ratingStepper.autorepeat = true
        ratingStepper.maximumValue = 10
    }
    
    func updateRating(){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.currentRatingLabel.text = String(self.curRating)+"/10"
            self.ratingSlider.value = Float(self.curRating)
        }
    }
    
    @IBAction func submitRating(_ sender: Any) {
        if (self.curRating) > 5{
            self.delegate?.updateFeedbackText(withText: "Thank you for liking our App :)")
        }else{
            self.delegate?.updateFeedbackText(withText: "Sorry that our App disappoint ya :(")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onStepperChanged(_ sender: UIStepper) {
        let newRating = Int(sender.value)
        if (newRating > 10){
            self.curRating = 10
        }else{
            self.curRating = Int(sender.value)
        }
        updateRating()
    }
    
    @IBAction func onSliderChanged(_ sender: UISlider) {
        let newRating = Int(sender.value)
        if (newRating > 10){
            self.curRating = 10
        }else{
            self.curRating = Int(sender.value)
        }
        updateRating()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initStepper()
        // Do any additional setup after loading the view.
    }
    


}
