//
//  Character.swift
//  TheBreakingBad
//
//  Created by AvanticaMAC2 on 1/29/21.
//

import Foundation

struct Character: Codable {
    var charId: Int?
    var name: String?
    var birthday: String?
    var occupation: [String]?
    var img: String?
    var status: String?
    var appearance: [Int]?
    var nickName: String?
    var portrayed: String?
    
    enum CodingKeys: String, CodingKey {
        case charId = "char_id"
        case name
        case birthday
        case occupation
        case img
        case status
        case appearance
        case nickName = "nickname"
        case portrayed
    }
    
    init() {
        name = "Jorge Azurduy"
        charId = 1001
        birthday = "Algun rato"
        occupation = ["Developer"]
        img = "https://scontent.fvvi1-2.fna.fbcdn.net/v/t1.0-9/15317831_1273750409366064_5728964937089161984_n.jpg?_nc_cat=102&ccb=3&_nc_sid=174925&_nc_ohc=QUwcrw5B89oAX_gIvNA&_nc_ht=scontent.fvvi1-2.fna&oh=259361ee0f470e136300b72c840caa8e&oe=6049673C"
        status = "Married"
        appearance = [1,2,3,4,5]
        nickName = "Coco"
        portrayed = "S/N"
    }
}
