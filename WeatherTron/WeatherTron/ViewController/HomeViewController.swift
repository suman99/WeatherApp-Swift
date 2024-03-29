//
//  ViewController.swift
//  WeatherTron
//
//  Created by Bhaskaran, Suman (US - Bengaluru) on 12/23/17.
//  Copyright © 2017 Wipro. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var forecastTableView: UITableView!
    @IBOutlet weak var cityName: UILabel!
    
    fileprivate var viewModel: ForecastViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        viewModel = ForecastViewModel()
        loadForecastDataOnView()
    }
    
    private func setupView() {
        forecastTableView.rowHeight = UITableView.automaticDimension
        forecastTableView.rowHeight = 120
        forecastTableView.register(UINib.init(nibName: NibFile.dayTableViewCell, bundle: nil), forCellReuseIdentifier: CellIdentifiers.dayTableViewCell)
    }
    
    @objc func loadForecastDataOnView() {
        viewModel?.reloadList = { [weak self] () in
            DispatchQueue.main.async {
                self?.cityName.text = self?.viewModel?.location
                self?.forecastTableView.reloadData()
            }
        }

    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfRows = viewModel?.daysForecast.count else { return 0   }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = forecastTableView.dequeueReusableCell(withIdentifier: CellIdentifiers.dayTableViewCell) as? DayTableViewCell {
            cell.viewModel = viewModel?.daysForecast[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

