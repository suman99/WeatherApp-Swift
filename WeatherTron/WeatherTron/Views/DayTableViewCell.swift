//
//  DayTableViewCell.swift
//  WeatherTron
//
//  Created by Bhaskaran, Suman (US - Bengaluru) on 12/23/17.
//  Copyright © 2017 Wipro. All rights reserved.
//

import UIKit

class DayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    
    let cellWidth = 80
    let cellHeight = 80
    
    
    var viewModel: DayViewModel? {
        didSet {
            self.dayLabel.text = viewModel?.day
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    func setupView() {
        weatherCollectionView.register(UINib(nibName: NibFile.weatherCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CellIdentifiers.weatherCollectionViewCell)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

extension DayTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let items = viewModel?.weatherForecast.count else { return 0 }
        return items
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = weatherCollectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.weatherCollectionViewCell, for: indexPath) as? WeatherCollectionViewCell {
            cell.viewModel = viewModel?.weatherForecast[0]
            return cell
        }
        return UICollectionViewCell()
    }
}

extension DayTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
