//
//  RandomUser.swift
//  Parsing-JSON-Lab NOV 26
//
//  Created by World Domination a Brand on 12/5/19.
//  Copyright © 2019 Pursuitful stuff. All rights reserved.
//

import Foundation

struct RandomUser: Codable {
    let results: [User]
}

struct User: Codable {
    let name: Name
    let location: Location 
    let email : String
    let dob: DOB
    let phone: String
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String
}

struct Location: Codable {
    let street: Address
}

struct Address: Codable {
    let number: Int
    let name: String
}

struct Email: Codable {
    let email: String
}

struct DOB: Codable {
    let date: String
}

extension RandomUser {
    
    static func getRandomUser() -> [User] {
    var allUsers = [User]()
        guard let fileUrl = Bundle.main.url(forResource: "randomUser", withExtension: "json") else {
            fatalError("couldn't locate the file")
        }
        do {
           let data = try Data(contentsOf: fileUrl)
            
            let specificUser = try JSONDecoder().decode(RandomUser.self, from: data)
            
            allUsers = specificUser.results
        } catch {
            fatalError("passing info from json file doesn't work \(error)")
        }
        return allUsers
    }
    
}
