//
//  TeamInfoViewModel.swift
//  Dota
//
//  Created by Tatia on 11.04.21.
//

import Foundation

class TeamInfoViewModel {
    var teamInfo: TeamInfo?
    var teamID: Int

    init(teamID: Int) {
        self.teamID = teamID
    }
    
    func getTeamInfo( teamID: String, completion: @escaping () -> Void) {
        let url = Constants.teamIDUrl + teamID
        APIService.service.get(url: url) { [weak self] (result: Result<TeamInfo, Error>) in
            switch result {
            case .success(let teamInfo):
                self?.teamInfo = teamInfo
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
