//
//  TeamInfo.swift
//  Dota
//
//  Created by Tatia on 11.04.21.
//

import Foundation

struct TeamInfo: Codable {
    let teamID: Int
    let rating: Double
    let wins, losses, lastMatchTime: Int
    let name, tag: String
    let logoURL: String
    
    enum CodingKeys: String, CodingKey {
        case teamID = "team_id"
        case rating, wins, losses
        case lastMatchTime = "last_match_time"
        case name, tag
        case logoURL = "logo_url"
    }
}
