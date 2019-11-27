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
        
        guard let theCity = selectedCity else {
            print("selected city never got the variable")
            return
        }
        
        // need to say .first because =
        guard let theWeatherDescription = theCity.weather.first?.description else {
            print("it is wrong")
            return
        }
        
        currentWeatherLabel.text = ( " There will be \(theWeatherDescription)")
        
        tempLabel.text = (" It is \(theCity.main.temp.description)˚C ")
    }

}
