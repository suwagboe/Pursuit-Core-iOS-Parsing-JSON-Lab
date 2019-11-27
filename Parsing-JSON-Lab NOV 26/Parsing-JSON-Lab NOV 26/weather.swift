//
//  weather.swift
//  Parsing-JSON-Lab NOV 26
//
//  Created by World Domination a Brand on 11/27/19.
//  Copyright © 2019 Pursuitful stuff. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    // so inside of weatherData is ... a list that holds the cities
    let list: [City]
    
}

struct City: Codable {
    // inside of the cities that is inside of the list there are ...
    let name: String
    let main: Main // temp Info
    let weather: [Weather] // accessing the type struct weather
    
    
}

struct Main: Codable {
    // inside of main that is inside of city that is inside of list is...
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Weather: Codable {
    // inside of weather that is inside of city that is inside of list is ...
    let description: String
}

extension WeatherData {
    
    static func getWeatherData() -> [City]{
        // an empty instance to hold the arrays of weather
        var theActualCitiesData = [City]()
        
        // this hold all the data from the json
        guard let fileUrl = Bundle.main.url(forResource: "citiesWithinARectangleZone", withExtension: "json") else {
            fatalError("could not locate file")
        }
        
        do{
            //get the actual data from the cities file
            let data = try Data(contentsOf: fileUrl)
            
            // from the above seperated data find the actual data
            
                //Instance member 'decode' cannot be used on type 'JSONDecoder'; did you mean to use a value of this type instead? means you forgot the ()
            let specificWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            
            // applies the weather data to the empty instance already created
            theActualCitiesData = specificWeatherData.list
            
        } catch {
            fatalError("passing data from json into weather did not work \(error)")
        }
        return theActualCitiesData
    }
    
}
