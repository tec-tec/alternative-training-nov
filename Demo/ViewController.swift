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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveRestaurant(sender: AnyObject) {

        print(restoNameTextField.text)
        print(restoTypeSegmentedControl.selectedSegmentIndex)
        print(restoAddressTextField.text)
        print(restoGradeSlider.value)
        print(restocommentTextView.text)
    }

}

