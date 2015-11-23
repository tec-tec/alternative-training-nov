//
//  RestaurantManager.swift
//  Demo
//
//  Created by Ludovic Ollagnier on 23/11/2015.
//  Copyright © 2015 Tec-Tec. All rights reserved.
//

import UIKit

class RestaurantManager {

    private var restaurantArray = [Restaurant]()
    var allRestaurants: [Restaurant] {
        return restaurantArray
    }

    func addRestaurant(resto: Restaurant) {

        self.restaurantArray.append(resto)
    }

}
