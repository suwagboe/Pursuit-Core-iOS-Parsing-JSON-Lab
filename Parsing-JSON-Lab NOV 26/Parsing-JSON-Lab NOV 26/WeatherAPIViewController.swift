//
//  WeatherAPIViewController.swift
//  Parsing-JSON-Lab NOV 26
//
//  Created by World Domination a Brand on 11/26/19.
//  Copyright © 2019 Pursuitful stuff. All rights reserved.
//

import UIKit

class WeatherAPIViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // load the data into the tableView
    var weather = [Weather](){
        didSet{
            // property observer because once it gets the data it load the view controller with the data
            
            // want the data to reload in the tableView
            tableView.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        tableView.delegate = self
    }
    
    
    func loadData() {
        // assigns empty variable about the data from weather
        weather = WeatherData.getWeather()
    }
    

}

//extension WeatherAPIViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return weather.count
//    }
    
   // func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
      //  guard let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath.row) as
        
        
        // return cell}}



extension WeatherAPIViewController: UITableViewDelegate {
    // need the height of the rows
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    
    
}
