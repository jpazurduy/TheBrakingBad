//
//  DeathInformation.swift
//  TheBreakinBad
//
//  Created by AvanticaMAC2 on 2/9/21.
//

import Foundation

struct DeathInformation: Codable {
    var deathId: Int?
    var death: String?
    var cause: String?
    var responsible: String?
    var lastWords: String?
    var season: Int?
    var episode: Int?
    var numOfDeaths: Int?
    
    enum CodingKeys: String, CodingKey {
        case deathId = "death_id"
        case death
        case cause
        case responsible
        case lastWords = "last_words"
        case season
        case episode
        case numOfDeaths = "number_of_deaths"
    }
}
