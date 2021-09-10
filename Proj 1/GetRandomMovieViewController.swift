//
//  GetRandomMovieViewController.swift
//  Proj 1
//
//  Created by Joshua Sylvester on 9/8/21.
//

import UIKit

// Picker code adapted from: https://codewithchris.com/uipickerview-example/

class GetRandomMovieViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var genrePicker: UIPickerView!
    lazy var pickerData: [String] = [String]()
    lazy var selectedPickerValue: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.genrePicker.delegate = self
        self.genrePicker.dataSource = self
        
        let path = Bundle.main.path(forResource: "movies", ofType: "plist")!
        let dict = NSDictionary(contentsOfFile: path)
        let genresDict = dict?["genres"] as! NSDictionary
        pickerData = genresDict.allKeys as! [String]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }


    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let vc = segue.destination as? RandomMovieViewController{
            vc.genreName = pickerData[self.genrePicker.selectedRow(inComponent: 0)]
        }
    }
    
}
