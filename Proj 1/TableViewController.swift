//
//  TableViewController.swift
//  Proj 1
//
//  Created by Joshua Sylvester on 9/7/21.
//

import UIKit

class TableViewController: UITableViewController{
    
    lazy var appOptionsLabels = [String]()
    lazy var appOptionsSegues = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Code for reading in a plist was adapted from: https://www.ioscreator.com/tutorials/load-data-property-list-ios-tutorial
        let path = Bundle.main.path(forResource: "AppOptions", ofType: "plist")!
        let dict = NSDictionary(contentsOfFile: path)
        appOptionsLabels = dict!.object(forKey: "AppOptionsLabels") as! [String]
        appOptionsSegues = dict!.object(forKey: "AppOptionsSegues") as! [String]
    }
    
    // MARK: - Table View Function Overrides
    
    // Code for override table functions code was adapted from ICA 1 and https://www.ioscreator.com/tutorials/load-data-property-list-ios-tutorial
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return appOptionsLabels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UITableViewCell
        cell.textLabel!.text = appOptionsLabels[indexPath.row]
        return cell
    }
    
    // Adapted from : https://stackoverflow.com/questions/22759167/how-to-make-a-push-segue-when-a-uitableviewcell-is-selected
    // method to run when table view cell is tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: appOptionsSegues[indexPath.row], sender: self)
    }
    
//    // This function is called before the segue
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        // get a reference to the second view controller
//        let secondViewController = segue.destination as! SecondViewController
//
//        // set a variable in the second view controller with the data to pass
//        secondViewController.receivedData = "hello"
//    }
    
////     MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//
//        if let vc = segue.destination as? ViewController,
//           let cell = sender as? UITableViewCell,
//           let name = cell.textLabel?.text {
//                vc.displayImageName = name
//        }
//    }

}
















////
////  TableViewController.swift
////  Proj 1
////
////  Created by Joshua Sylvester on 9/7/21.
////
//
//import UIKit
//
//class TableViewController: UITableViewController{
//
//    var appOptions = [String]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
//        // Code for reading in a plist was adapted from: https://www.ioscreator.com/tutorials/load-data-property-list-ios-tutorial
//        let path = Bundle.main.path(forResource: "AppOptions2", ofType: "plist")!
//        let dict = NSDictionary(contentsOfFile: path)
//        appOptions = dict!.object(forKey: "AppOptions2") as! [String]
////        let appOptions = Dictionary(dict!.object(forKey: "AppOptions2"))
//
//    }
//
//    // MARK: - Table View Function Overrides
//
//    // Code for override table functions code was adapted from ICA 1 and https://www.ioscreator.com/tutorials/load-data-property-list-ios-tutorial
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // Return the number of rows in the section.
//        return appOptions.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UITableViewCell
//        cell.textLabel!.text = appOptions[indexPath.row]
//        return cell
//    }
//
//    // Adapted from : https://stackoverflow.com/questions/22759167/how-to-make-a-push-segue-when-a-uitableviewcell-is-selected
//    // method to run when table view cell is tapped
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
////        // Segue to the second view controller
////        switch indexPath {
////        case 0:
////            self.performSegue(withIdentifier: "yourSegue", sender: self)
////        }
//
//    }
//
////    // This function is called before the segue
////    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////
////        // get a reference to the second view controller
////        let secondViewController = segue.destination as! SecondViewController
////
////        // set a variable in the second view controller with the data to pass
////        secondViewController.receivedData = "hello"
////    }
//
//    // MARK: - Navigation
//
////    // In a storyboard-based application, you will often want to do a little preparation before navigation
////    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////        // Get the new view controller using segue.destination.
////        // Pass the selected object to the new view controller.
////
////        if let vc = segue.destination as? ViewController,
////           let cell = sender as? UITableViewCell,
////           let name = cell.textLabel?.text {
////                vc.displayImageName = name
////        }
////    }
//
//}
