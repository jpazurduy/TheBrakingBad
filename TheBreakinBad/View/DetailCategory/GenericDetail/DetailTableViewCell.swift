//
//  DetailTableViewCell.swift
//  TheBreakinBad
//
//  Created by AvanticaMAC2 on 2/10/21.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    @IBOutlet var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(label: String, desc: String) {
        self.label.text = label
        self.desc.text = desc
    }

}
