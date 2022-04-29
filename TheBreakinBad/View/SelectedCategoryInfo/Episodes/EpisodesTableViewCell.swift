//
//  EpisodesTableViewCell.swift
//  TheBreakinBad
//
//  Created by AvanticaMAC2 on 2/9/21.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {

    @IBOutlet var episodeNameLabel: UILabel!
    @IBOutlet var seasonLabel: UILabel!

    static let identifier = "reusableEpisode"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(name: String, season: String) {
        episodeNameLabel.text = name
        seasonLabel.text = season
    }

    static func nib() -> UINib {
        return UINib(nibName: "EpisodesTableViewCell", bundle: nil)
    }
}
