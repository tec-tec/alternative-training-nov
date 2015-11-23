//
//  Restaurant.swift
//  Demo
//
//  Created by Ludovic Ollagnier on 23/11/2015.
//  Copyright © 2015 Tec-Tec. All rights reserved.
//

import UIKit

protocol Adressable {

    var adress: String { get }
}

extension Adressable {

    var adress: String { return "1 Infinite Loop, Cupertino, CA" }
}

struct Restaurant: CustomStringConvertible, Adressable {

    enum RestoType: String {
        case Unknown
        case FastFood
        case Indonesian
        case Japanese
        case French

        static var allCases: [String] {
            return [self.Unknown.rawValue,self.FastFood.rawValue,self.Indonesian.rawValue,self.Japanese.rawValue,self.French.rawValue,]
        }
    }

    var name: String
    var type: RestoType
    var adress: String
    var grade: Float
    var comment: String

    var description: String {
        return "Restaurant : " + name + ", type : " + type.rawValue
    }
}