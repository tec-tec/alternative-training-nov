//
//  Restaurant.swift
//  Demo
//
//  Created by Ludovic Ollagnier on 23/11/2015.
//  Copyright © 2015 Tec-Tec. All rights reserved.
//

import UIKit

struct Restaurant {

    enum RestoType: String {
        case Unknown
        case FastFood
        case Indian
        case Japanese
        case French

        static var allCases: [String] {
            return [self.Unknown.rawValue,self.FastFood.rawValue,self.Indian.rawValue,self.Japanese.rawValue,self.French.rawValue,]
        }
    }

    var name: String
    var type: RestoType
    var adress: String
    var grade: Float
    var comment: String
}