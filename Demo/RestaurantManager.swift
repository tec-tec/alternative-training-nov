//
//  RestaurantManager.swift
//  Demo
//
//  Created by Ludovic Ollagnier on 23/11/2015.
//  Copyright © 2015 Tec-Tec. All rights reserved.
//

import UIKit

class RestaurantManager {

    struct Constants {
        static let modelUpdatedNotificationName = "modelUpdated"
    }

    static let sharedInstance = RestaurantManager()

    private var restaurantArray = [Restaurant]()
    var allRestaurants: [Restaurant] {
        return restaurantArray
    }

    private init() {

        createFakeRestaurants()
    }

    func createFakeRestaurants() {

        restaurantArray.append(Restaurant(name: "Test", type: Restaurant.RestoType.Indonesian, adress: "10 Rue de la pompe, 75015 Paris", grade: 5, comment: "Test de commentaire pour un restaurant. C'était très bon !"))
        restaurantArray.append(Restaurant(name: "Test2", type: Restaurant.RestoType.Indonesian, adress: "11 Rue de la pompe, 75015 Paris", grade: 5, comment: "Test de commentaire pour un restaurant. C'était très bon !"))
        restaurantArray.append(Restaurant(name: "Test3", type: Restaurant.RestoType.Indonesian, adress: "12 Rue de la pompe, 75015 Paris", grade: 5, comment: "Test de commentaire pour un restaurant. C'était très bon !"))
        restaurantArray.append(Restaurant(name: "Test4", type: Restaurant.RestoType.Indonesian, adress: "13 Rue de la pompe, 75015 Paris", grade: 5, comment: "Test de commentaire pour un restaurant. C'était très bon !"))
        restaurantArray.append(Restaurant(name: "Test5", type: Restaurant.RestoType.Indonesian, adress: "10 Rue de la pompe, 75015 Paris", grade: 5, comment: "Test de commentaire pour un restaurant. C'était très bon !"))
    }

    func addRestaurant(resto: Restaurant) {

        self.restaurantArray.append(resto)

        let notCenter = NSNotificationCenter.defaultCenter()
        notCenter.postNotificationName(Constants.modelUpdatedNotificationName, object: nil)
    }

}
