//
//  Path.swift
//  TheBreakinBad
//
//  Created by AvanticaMAC2 on 2/2/21.
//

import Foundation

struct Path {
    static let baseURL = "https://www.breakingbadapi.com/"
    
    static func character(withID: Int) -> String {
        return baseURL + "api/characters/" + withID.description
    }
    
    static let characters = baseURL + "api/characters?category=Breaking+Bad"
    static let episodes = baseURL + "api/episodes?series=Breaking+Bad"
    static let deaths = baseURL + "api/deaths"
}
