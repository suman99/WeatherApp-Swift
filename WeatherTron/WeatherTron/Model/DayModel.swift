//
//  DayModel.swift
//  WeatherTron
//
//  Created by Bhaskaran, Suman (US - Bengaluru) on 12/23/17.
//  Copyright © 2017 Wipro. All rights reserved.
//

import UIKit

class DayModel: NSObject {
    
    var forecastDate: String
    var forecastTime: String
    var weatherList: [WeatherModel]
    
    init(forecastDate: String, forecastTime: String, weatherList: [WeatherModel]) {
        self.forecastDate = forecastDate
        self.forecastTime = forecastTime
        self.weatherList  = weatherList
    }
}
