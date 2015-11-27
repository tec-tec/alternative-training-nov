//
//  MovementsViewController.swift
//  Advanced Functions
//
//  Created by Ludovic Ollagnier on 24/11/2015.
//  Copyright © 2015 Tec-Tec. All rights reserved.
//

import UIKit
import CoreMotion

class MovementsViewController: UIViewController {

    @IBOutlet weak var x: UILabel!
    @IBOutlet weak var y: UILabel!
    @IBOutlet weak var z: UILabel!

    @IBOutlet weak var gyroX: UILabel!
    @IBOutlet weak var gyroY: UILabel!
    @IBOutlet weak var gyroZ: UILabel!

    let manager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startAccelerometer(sender: AnyObject) {

        guard manager.accelerometerAvailable else {
            return
        }

        guard manager.accelerometerActive == false else {
            manager.stopAccelerometerUpdates()
            return
        }

        manager.accelerometerUpdateInterval = 0.5
        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) { (data, error) -> Void in

            guard let accelerometerData = data else {
                return
            }

            self.x.text = "\(Float(accelerometerData.acceleration.x))"
            self.y.text = "\(Float(accelerometerData.acceleration.y))"
            self.z.text = "\(Float(accelerometerData.acceleration.z))"
        }

    }

    @IBAction func startGyro(sender: AnyObject) {

        guard manager.gyroAvailable else {
            return
        }

        guard manager.gyroActive == false else {
            manager.stopGyroUpdates()
            return
        }

        manager.gyroUpdateInterval = 0.5
        manager.startGyroUpdatesToQueue(NSOperationQueue.mainQueue()) { (data, error) -> Void in

            guard let gyroData = data else {
                return
            }

            self.gyroX.text = "\(Float(gyroData.rotationRate.x))"
            self.gyroY.text = "\(Float(gyroData.rotationRate.y))"
            self.gyroZ.text = "\(Float(gyroData.rotationRate.z))"
        }
        
    }


}
