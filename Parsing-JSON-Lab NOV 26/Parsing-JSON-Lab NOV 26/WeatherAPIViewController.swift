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
   // @IBOutlet weak var searchBar: UISearchBar!
    
    // load the data into the tableView
    var citiesInfo = [cities](){
        didSet{
            // property observer because once it gets the data it load the view controller with the data
            
            // want the data to reload in the tableView
            tableView.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
      //  tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func loadData() {
        // assigns empty variable about the data from weather
        citiesInfo = WeatherData.getWeatherData()
    }
    

}

extension WeatherAPIViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "citiesCell", for: indexPath)
        
        // why is it .row here and not for the one above
        let selectedcities = citiesInfo[indexPath.row]
        
        cell.textLabel?.text = selectedcities.name
        //cell.detailTextLabel?.text = (" the weather is  \(selectedcities.weather.description)")
        
         return cell
        
        
    }
    
    
}



//extension WeatherAPIViewController: UITableViewDelegate {
//    // need the height of the rows
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 180
//    }
//}
