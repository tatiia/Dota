//
//  TeamInfoViewController.swift
//  Dota
//
//  Created by Tatia on 12.04.21.
//

import UIKit

class TeamInfoViewController: UIViewController {
    
    var teamViewModel: TeamInfoViewModel = TeamInfoViewModel(teamID: 0)

    
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamRating: UILabel!
    @IBOutlet weak var teamWins: UILabel!
    @IBOutlet weak var teamLosses: UILabel!
    @IBOutlet weak var lastMatchTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo()

        // Do any additional setup after loading the view.
    }
    
    func getInfo() {
        teamViewModel.getTeamInfo(teamID: String(teamViewModel.teamID)) { [weak self] in
            guard let self = self else {return}
            guard let teamInfo = self.teamViewModel.teamInfo else {return}
            DispatchQueue.main.async {
                self.teamName.text = teamInfo.name
                let url = URL(string: teamInfo.logoURL)!
                APIService.service.downloadImage(from: url, imageView: self.teamImage)
                self.teamRating.text = "Rating: \(teamInfo.rating)"
                self.teamWins.text = "Total Wins: \(teamInfo.wins)"
                self.teamLosses.text = "Total Losses: \(teamInfo.losses)"
                let time = TimeInterval(teamInfo.lastMatchTime)
                let lastMatchTime = Date(timeIntervalSince1970: time)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
                let lastMatchTimeString = dateFormatter.string(from: lastMatchTime)
                self.lastMatchTime.text = "Last Match Time: \(lastMatchTimeString)"
            }
        }
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
