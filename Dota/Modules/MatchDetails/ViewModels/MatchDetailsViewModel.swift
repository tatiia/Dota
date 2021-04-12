//
//  MatchDetailsViewModel.swift
//  Dota
//
//  Created by Tatia on 09.04.21.
//

import Foundation



class MatchDetailsViewModel {
    
    var matchDetails: MatchDetails?
    var matchID: Int
    
    init(matchID: Int) {
        self.matchID = matchID
    }
    
    
    func getMatchDetails(completion: @escaping () -> Void) {
        let url = Constants.matchDetailsUrl + String(matchID)
        APIService.service.get(url: url) { [weak self] (result: Result<MatchDetails, Error>) in
            switch result {
            case .success(let matchdetails):
                self?.matchDetails = matchdetails
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
