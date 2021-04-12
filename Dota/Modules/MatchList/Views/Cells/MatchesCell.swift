//
//  MatchesCell.swift
//  Dota
//
//  Created by Tatia on 09.04.21.
//

import UIKit

class MatchesCell: UITableViewCell {
    @IBOutlet weak var MatchId: UILabel!
    @IBOutlet weak var helperView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
