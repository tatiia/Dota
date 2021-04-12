//
//  Constants.swift
//  Dota
//
//  Created by Tatia on 09.04.21.
//

import Foundation

class Constants {
    static let matchID = [
        5932072574,
        5926212113,
        3278690226,
        2518745501,
        3246691279,
        3277744144,
        5939607004,
        3116432662,
        5806777746,
        5898927923
    ]
    
    static let matchDetailsUrl = "https://api.opendota.com/api//matches/"
    static let teamIDUrl = "https://api.opendota.com/api/teams/"
    
    static let matchesCell = "MatchesCell"
    static let MatchDetailsViewController = "MatchDetailsViewController"
    static let TeamInfoViewController = "TeamInfoViewController"
   
    
    enum gameMode: Int, CustomStringConvertible {
            
            case game_mode_unknown
            case game_mode_all_pick
            case game_mode_captains_mode
            case game_mode_random_draft
            case game_mode_single_draft
            case game_mode_all_random
            case game_mode_intro
            case game_mode_diretide
            case game_mode_reverse_captains_mode
            case game_mode_greeviling
            case game_mode_tutorial
            case game_mode_mid_only
            case game_mode_least_played
            case game_mode_limited_heroes
            case game_mode_compendium_matchmaking
            case game_mode_custom
            case game_mode_captains_draft
            case game_mode_balanced_draft
            case game_mode_ability_draft
            case game_mode_event
            case game_mode_all_random_death_match
            case game_mode_1v1_mid
            case game_mode_all_draft
            case game_mode_turbo
            case game_mode_mutation
            
            typealias RawValue = Int
            
            var description: String {
                switch self {
                case .game_mode_unknown:
                    return "Unknown"
                case .game_mode_all_pick:
                    return "All Pick"
                case .game_mode_captains_mode:
                    return "Captains Mode"
                case .game_mode_random_draft:
                    return "Random Draft"
                case .game_mode_single_draft:
                    return "Single Draft"
                case .game_mode_all_random:
                    return "All Random"
                case .game_mode_intro:
                    return "Intro"
                case .game_mode_diretide:
                    return "Diretide"
                case .game_mode_reverse_captains_mode:
                    return "Reverse Captains Mode"
                case .game_mode_greeviling:
                    return "Greeviling"
                case .game_mode_tutorial:
                    return "Tutorial"
                case .game_mode_mid_only:
                    return "Mid Only"
                case .game_mode_least_played:
                    return "Least Played"
                case .game_mode_limited_heroes:
                    return "Limited Heroes"
                case .game_mode_compendium_matchmaking:
                    return "Compendium Matchmaking"
                case .game_mode_custom:
                    return "Custom"
                case .game_mode_captains_draft:
                    return "Captains Draft"
                case .game_mode_balanced_draft:
                    return "Balanced Draft"
                case .game_mode_ability_draft:
                    return "Ability Draft"
                case .game_mode_event:
                    return "Event"
                case .game_mode_all_random_death_match:
                    return "All Random Death Match"
                case .game_mode_1v1_mid:
                    return "1v1 Mid"
                case .game_mode_all_draft:
                    return "All Draft"
                case .game_mode_turbo:
                    return "Turbo"
                case .game_mode_mutation:
                    return "Mutation"
                }
            }
            
        }
    
 
}
