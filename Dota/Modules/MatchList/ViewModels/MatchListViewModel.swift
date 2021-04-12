//
//  MatchViewModel.swift
//  Dota
//
//  Created by Tatia on 09.04.21.
//

import Foundation

class MatchListViewModel {
    var matches: [Match] = []
    
    func getMatches() {
        self.matches = Constants.matchID.map{ Match(id: $0)}
    }

    
}


