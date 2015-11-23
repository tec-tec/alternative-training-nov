//
//  ViewController.swift
//  Demo
//
//  Created by Ludovic Ollagnier on 20/11/2015.
//  Copyright © 2015 Tec-Tec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var restoNameTextField: UITextField!
    @IBOutlet weak var restoTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var restoAddressTextField: UITextField!
    @IBOutlet weak var restoGradeSlider: UISlider!
    @IBOutlet weak var restocommentTextView: UITextView!
    let restoManager = RestaurantManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        restoTypeSegmentedControl.removeAllSegments()
        for (i, type) in Restaurant.RestoType.allCases.enumerate() {
            restoTypeSegmentedControl.insertSegmentWithTitle(type, atIndex: i, animated: true)
        }
        restoTypeSegmentedControl.selectedSegmentIndex = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveRestaurant(sender: AnyObject) {

        guard restoNameTextField.text?.isEmpty == false else {
            return
        }

        guard restoAddressTextField.text?.isEmpty == false else {
            return
        }

        let restoTypeString = restoTypeSegmentedControl.titleForSegmentAtIndex(restoTypeSegmentedControl.selectedSegmentIndex)!

        let restoType = Restaurant.RestoType(rawValue: restoTypeString)

        let resto =
        Restaurant(name: restoNameTextField.text!, type: restoType!, adress: restoAddressTextField.text!, grade: restoGradeSlider.value, comment: restocommentTextView.text)

        restoManager.addRestaurant(resto)
        print(restoManager.allRestaurants)
    }

}

