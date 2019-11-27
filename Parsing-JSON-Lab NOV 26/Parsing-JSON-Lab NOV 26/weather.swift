//
//  weather.swift
//  Parsing-JSON-Lab NOV 26
//
//  Created by World Domination a Brand on 11/27/19.
//  Copyright © 2019 Pursuitful stuff. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let list: [cities]
    
}

struct cities: Codable {
    let name: String
    let main =  [String: Double]() // temp Info
    let weather: [weather]
}

struct main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct weather: Codable {
    let description: String
}

extension WeatherData {
    
    static func getWeatherData() -> [cities]{
        // an empty instance to hold the arrays of weather
        var theActualCitiesData = [cities]()
        
        // this hold all the data from the json
        guard let fileUrl = Bundle.main.url(forResource: "CitiesWithinARectangleZone", withExtension: "json") else {
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
