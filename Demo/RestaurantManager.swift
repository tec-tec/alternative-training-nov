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
        getWebserviceData()
    }

    private func createFakeRestaurants() {

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
        
        let urlRequest = NSMutableURLRequest(URL: NSURL(string: "http://tectec.fr:3000/restaurant")!)
        urlRequest.HTTPMethod = "POST"
        let data = try? NSJSONSerialization.dataWithJSONObject(resto.dictionaryForJSON, options: NSJSONWritingOptions.PrettyPrinted)
        urlRequest.HTTPBody = data

        let session = NSURLSession.sharedSession().dataTaskWithRequest(urlRequest) { (data, response, error) -> Void in

        }
        
        session.resume()
    }

    private func getWebserviceData() {

        let urlRequest = NSURLRequest(URL: NSURL(string: "http://tectec.fr:3000/restaurant")!)
        let session = NSURLSession.sharedSession().dataTaskWithRequest(urlRequest) { (data, response, error) -> Void in

            if let jsonObject = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject] {

                for resto in jsonObject {
                    if let restoDict = resto as? [String:AnyObject],
                    let name = restoDict["name"] as? String,
                    let address = restoDict["address"] as? String,
                    let grade = restoDict["grade"] as? Float,
                    let typeString = restoDict["type"] as? String,
                    let comment = restoDict["comment"] as? String{

                        let newRestaurant: Restaurant

                        if let type = Restaurant.RestoType(rawValue: typeString) {
                            newRestaurant = Restaurant(name: name, type: type, adress: address, grade: grade, comment: comment)
                        } else {
                            newRestaurant = Restaurant(name: name, type: Restaurant.RestoType.Unknown, adress: address, grade: grade, comment: comment)
                        }

                        self.restaurantArray.append(newRestaurant)
                    }
                }
                NSNotificationCenter.defaultCenter().postNotificationName(Constants.modelUpdatedNotificationName, object: nil)
            }
        }
        session.resume()
    }

}
