//
//  MatchDetailsViewController.swift
//  Dota
//
//  Created by Tatia on 09.04.21.
//

import UIKit

class MatchDetailsViewController: UIViewController {
    
    var matchViewModel: MatchDetailsViewModel!
    var teamViewModel: TeamInfoViewModel = TeamInfoViewModel(teamID: 0)
    
    @IBOutlet weak var gameMode: UILabel!
    @IBOutlet weak var winner: UILabel!
    @IBOutlet weak var radiantScore: UILabel!
    @IBOutlet weak var direScore: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var firstBloodScore: UILabel!
    @IBOutlet weak var matchID: UILabel!
    @IBOutlet weak var radiantTeam: UIButton!
    @IBOutlet weak var radiantImage: UIImageView!
    @IBOutlet weak var direTeam: UIButton!
    @IBOutlet weak var direImage: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getDetails()

    }
    
    
    func getDetails() {
        matchViewModel.getMatchDetails { [weak self] in
            DispatchQueue.main.async {
                guard let matchDetails = self?.matchViewModel.matchDetails else {return}
                guard let self = self else {return}
                self.matchID.text = "Match ID: \(self.matchViewModel.matchID)"
                let gameModeName = Constants.gameMode.init(rawValue: matchDetails.gameMode)
                self.gameMode.text = "\(gameModeName?.description ?? "")"
                self.radiantScore.text = "\(matchDetails.radiantScore)"
                self.direScore.text = "\(matchDetails.direScore)"
                let formatter = DateComponentsFormatter()
                formatter.allowedUnits = [.hour, .minute, .second]
                let duration = formatter.string(from: TimeInterval(matchDetails.duration))!
                self.duration.text = "Duration: \(duration)"
                let firstBloodTime = formatter.string(from: TimeInterval(matchDetails.firstBloodTime))!
                self.firstBloodScore.text = "First Blood Time: \(firstBloodTime)"
                self.getTeamInfo()

            }
        }
    }
    
    func getTeamInfo() {
        guard let matchDetails = self.matchViewModel.matchDetails else {return}
        let radiantID = String(matchDetails.radiantTeamID)
        teamViewModel.getTeamInfo(teamID: radiantID) { [weak self] in
            guard let self = self else {return}
            guard let teamInfo = self.teamViewModel.teamInfo else {return}
            DispatchQueue.main.async {
                self.radiantTeam.setTitle(teamInfo.name, for: .normal)
                if matchDetails.radiantWin == true {
                    self.winner.text = "\(teamInfo.name) VICTORY!"
                    self.radiantScore.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                } else {
                    self.radiantScore.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                }
                let url = URL(string: teamInfo.logoURL)!
                APIService.service.downloadImage(from: url, imageView: self.radiantImage)
            }
        }
        let direID = String(matchDetails.direTeamID)
        teamViewModel.getTeamInfo(teamID: direID) { [weak self] in
            guard let self = self else {return}
            guard let teamInfo = self.teamViewModel.teamInfo else {return}
            DispatchQueue.main.async {
                self.direTeam.setTitle(teamInfo.name, for: .normal)
                if matchDetails.radiantWin == false {
                    self.winner.text = "\(teamInfo.name) VICTORY!"
                    self.direScore.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                } else {
                    self.direScore.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                }
                let url = URL(string: teamInfo.logoURL)!
                APIService.service.downloadImage(from: url, imageView: self.direImage)
            }
        }
    }
    
    @IBAction func radiantTeamInfo(_ sender: UIButton) {
        guard let radiantTeamInfoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Constants.TeamInfoViewController) as? TeamInfoViewController else {return}
        let radiantID = matchViewModel.matchDetails?.radiantTeamID
        radiantTeamInfoVC.teamViewModel = TeamInfoViewModel(teamID: radiantID!)
        self.navigationController?.pushViewController(radiantTeamInfoVC, animated: true)
    }
    
    @IBAction func direTeamInfo(_ sender: UIButton) {
        guard let direTeamInfoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Constants.TeamInfoViewController) as? TeamInfoViewController else {return}
        let direID = matchViewModel.matchDetails?.direTeamID
        direTeamInfoVC.teamViewModel = TeamInfoViewModel(teamID: direID!)
        self.navigationController?.pushViewController(direTeamInfoVC, animated: true)
    }
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
