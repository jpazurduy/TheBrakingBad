//
//  Episode.swift
//  TheBreakinBad
//
//  Created by AvanticaMAC2 on 2/9/21.
//

import Foundation

struct Episode: Codable {
    
    var episodeId: Int?
    var title: String?
    var season: String?
    var airDate: String?
    var characters: [String]?
    var episode: String?
    var series: String?
    
    enum CodingKeys: String, CodingKey {
        case episodeId = "episode_id"
        case title
        case season
        case airDate = "air_date"
        case characters
        case episode
        case series
        
    }
}
