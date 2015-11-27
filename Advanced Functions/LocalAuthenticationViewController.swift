//
//  LocalAuthenticationViewController.swift
//  Advanced Functions
//
//  Created by Ludovic Ollagnier on 25/11/2015.
//  Copyright © 2015 Tec-Tec. All rights reserved.
//

import UIKit
import LocalAuthentication

class LocalAuthenticationViewController: UIViewController {

    @IBOutlet weak var userAuthenticatedSwitch: UISwitch!
    @IBOutlet weak var biometricsOnlyButton: UIButton! {
        didSet {
            biometricsOnlyButton.hidden = !context.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: nil)
        }
    }
    @IBOutlet weak var codeOrBiometricsButton: UIButton! {
        didSet {
            codeOrBiometricsButton.hidden = !context.canEvaluatePolicy(.DeviceOwnerAuthentication, error: nil)
        }
    }

    let context = LAContext()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func codeOrBiometrics(sender: AnyObject) {

        var error: NSError?
        guard context.canEvaluatePolicy(.DeviceOwnerAuthentication, error: &error) else {
            print(error)
            return
        }

        authenticateWithPolicy(.DeviceOwnerAuthentication)
    }
    
    @IBAction func biometricsOnly(sender: AnyObject) {

        var error: NSError?
        guard context.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: &error) else {
            print(error)
            return
        }

        authenticateWithPolicy(.DeviceOwnerAuthenticationWithBiometrics)
    }

    func authenticateWithPolicy(policy: LAPolicy) {

        let myLocalizedReasonString = "This is the message that explain why I need authentication"
        context.evaluatePolicy(policy, localizedReason: myLocalizedReasonString, reply: { (success, error) -> Void in

            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.userAuthenticatedSwitch.setOn(success, animated: true)
            })
        })
    }
}
