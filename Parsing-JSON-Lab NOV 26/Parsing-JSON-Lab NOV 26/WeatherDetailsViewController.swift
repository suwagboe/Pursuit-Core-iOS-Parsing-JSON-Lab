//
//  WeatherDetailsViewController.swift
//  Parsing-JSON-Lab NOV 26
//
//  Created by World Domination a Brand on 11/27/19.
//  Copyright © 2019 Pursuitful stuff. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    
    var selectedCity: City?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        navigationItem.title = selectedCity?.name
        currentWeatherLabel.text = selectedCity?.weather.description
        tempLabel.text = selectedCity?.main.temp.description
    }

}
