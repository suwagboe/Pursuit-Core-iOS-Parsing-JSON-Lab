//
//  Color.swift
//  Parsing-JSON-Lab NOV 26
//
//  Created by World Domination a Brand on 12/5/19.
//  Copyright © 2019 Pursuitful stuff. All rights reserved.
//

import Foundation

struct AllColors: Codable {
    let colors: [Color]
}

struct Color: Codable {
    let rgb: RGB
    let name: ColorName
    let image: Image
    let hex: Hex
}

struct ColorName: Codable {
    let value: String
}

struct RGB: Codable {
    // let fraction: Fraction if I wanted asscess to fraction
    let r: Int
    let g: Int
    let b: Int
    // didvide it by 255
}


//struct Name: Codable {
//    let value: String
//}

struct Image: Codable {
    // not really a string but im not sure if I a image
    let named: String
}

struct Hex: Codable {
    let value: String
    let clean: String
}

extension Color {
    
    static func getColors() -> [Color] {

        // the empty variable that will hold the data
        var allColors = [Color]()

        guard let fileUrl = Bundle.main.url(forResource: "color", withExtension: "json") else {
            fatalError("could not locate colors json file")
        }

        do{
            // im still not completly sure why we need to do a do, catch... is it because the file if from the json and it could be wrong?
            let data = try Data(contentsOf: fileUrl)
            //
            let specificColorData = try JSONDecoder().decode(AllColors.self, from: data)
            
            // because there is only one level you do not need to access something to get into something else.. you only need access into the data
            allColors = specificColorData.colors
        }catch {
            fatalError("no colors \(error)")
        }
        return allColors
    }
    
}
