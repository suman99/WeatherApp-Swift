//
//  WeatherTableViewCell.swift
//  WeatherTron
//
//  Created by Bhaskaran, Suman (US - Bengaluru) on 12/23/17.
//  Copyright © 2017 Wipro. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var weatherConditionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var viewModel: WeatherViewModel? {
        didSet {
           self.weatherConditionLabel.text = viewModel?.weatherCondition
           self.temperatureLabel.text = viewModel?.temperature
        }
    }
}
