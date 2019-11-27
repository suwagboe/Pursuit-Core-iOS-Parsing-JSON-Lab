//
//  weather.swift
//  Parsing-JSON-Lab NOV 26
//
//  Created by World Domination a Brand on 11/27/19.
//  Copyright © 2019 Pursuitful stuff. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let allWeather: [Weather]
    
}

struct Weather: Codable {
    let name: String
    let temp: Double
    
}

extension WeatherData {
    
    static func getWeather() -> [Weather] {
        // an empty instance to hold the arrays of weather
        var weather = [Weather]()
        
        // this hold all the data from the json
        guard let fileUrl = Bundle.main.url(forResource: "CitiesWithinARectangleZone", withExtension: "json") else {
            fatalError("could not locate file")
        }
        
        do {
            
            //get the actual data from the cities file
            let data = try Data(contentsOf: fileUrl)
            
            // from the above seperated data find the actual data
            
                //Instance member 'decode' cannot be used on type 'JSONDecoder'; did you mean to use a value of this type instead? means you forgot the ()
            let specificWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            
            // applies the weather data to the empty instance already created
            weather = specificWeatherData.allWeather
        } catch {
            fatalError("passing data from json into weather did not work \(error)")
        }
        return weather
    }
    
}
