//
//  ViewController.swift
//  Dota
//
//  Created by Tatia on 08.04.21.
//

import UIKit


class MatchListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var viewModel = MatchListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMatches()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.matches.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.matchesCell, for: indexPath) as? MatchesCell else {return .init()}
        let currentMatch = viewModel.matches[indexPath.row].id
        cell.MatchId.text = "\(currentMatch)"
        cell.helperView.layer.cornerRadius = 10
        cell.helperView.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.helperView.layer.borderWidth = 2
        cell.helperView.layer.borderColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let MatchDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Constants.MatchDetailsViewController) as? MatchDetailsViewController else {return}
        let matchID = viewModel.matches[indexPath.row].id
        MatchDetailsVC.matchViewModel = MatchDetailsViewModel(matchID: matchID)
        self.navigationController?.pushViewController(MatchDetailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }

    


}

