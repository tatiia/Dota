//
//  MatchDetails.swift
//  Dota
//
//  Created by Tatia on 09.04.21.
//

import Foundation

struct MatchDetails: Codable {
    let gameMode: Int
    let radiantWin: Bool
    let duration: Int
    let firstBloodTime: Int
    let radiantScore: Int
    let radiantTeamID: Int
    let direScore: Int
    let direTeamID: Int
    
    enum CodingKeys: String, CodingKey {
        case gameMode = "game_mode"
        case radiantWin = "radiant_win"
        case duration
        case firstBloodTime = "first_blood_time"
        case radiantScore = "radiant_score"
        case radiantTeamID = "radiant_team_id"
        case direScore = "dire_score"
        case direTeamID = "dire_team_id"
    }
}
