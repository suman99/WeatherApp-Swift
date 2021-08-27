//
//  WeatherTronTests.swift
//  WeatherTronTests
//
//  Created by Bhaskaran, Suman (US - Bengaluru) on 12/23/17.
//  Copyright © 2017 Wipro. All rights reserved.
//

import XCTest
import PromiseKit

@testable import WeatherTron

class WeatherTronTests: XCTestCase {
    
    var storyBoard : UIStoryboard!
//    var forecastViewModel:ForecastViewModel!
    fileprivate var viewModel: ForecastViewModel?
    

    override func setUp() {
        super.setUp()
        storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
    }
    
    override func tearDown() {
        storyBoard = nil
        super.tearDown()
        
    }
    
    func testHomeController(){
        let testableVC = storyBoard.instantiateViewController(withIdentifier: "MainVC") as! HomeViewController
        
        //when
        _ = testableVC.view
        
        //then
        XCTAssertNotNil(testableVC.forecastTableView)
        
    }
    
    
}
