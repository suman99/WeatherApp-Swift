//
//  ForecastModel.swift
//  WeatherTron
//
//  Created by Bhaskaran, Suman (US - Bengaluru) on 12/23/17.
//  Copyright © 2017 Wipro. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    var temperature: Double
    var weatherCondition: String
    
    init(temperature: Double, weatherCondition: String) {
        self.temperature      = temperature
        self.weatherCondition = weatherCondition
    }
}
