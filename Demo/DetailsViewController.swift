//
//  DetailsViewController.swift
//  Demo
//
//  Created by Ludovic Ollagnier on 24/11/2015.
//  Copyright © 2015 Tec-Tec. All rights reserved.
//

import UIKit
import MapKit

class DetailsViewController: UIViewController {

    var aRestaurant: Restaurant!

    @IBOutlet weak var restaurantAddressLabel: UILabel!
    @IBOutlet weak var restaurantGradeLabel: UILabel!
    @IBOutlet weak var restaurantCommentTextView: UITextView!
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configureUI() {
        restaurantAddressLabel.text = aRestaurant.adress
        restaurantCommentTextView.text = aRestaurant.comment
        restaurantGradeLabel.text = "\(aRestaurant.grade)"
        title = aRestaurant.name
    }
}
