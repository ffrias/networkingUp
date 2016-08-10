//
//  OWCityModel.swift
//  openWeather
//
//  Created by Federico Frias on 8/9/16.
//  Copyright © 2016 ffrias. All rights reserved.
//
import UIKit

class OWCityModel {
    var name: String
    var description: String
    var icon: UIImage

    init(name: String, description: String, icon: UIImage){
        self.name = name
        self.description = description
        self.icon = icon
    }
}
