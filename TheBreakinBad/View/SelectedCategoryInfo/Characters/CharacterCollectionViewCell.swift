//
//  CharacterCollectionViewCell.swift
//  TheBreakinBad
//
//  Created by AvanticaMAC2 on 2/4/21.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    static let identifier = "characterCollectionID"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func cellTuning() {
        contentView.layer.cornerRadius = 6.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.clear.cgColor
    }
    
    func configure(imageURL: String, name: String, description: String) {
        
        let url = URL(string: imageURL)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data!)
            }
        }
        
        nameLabel.text = name
        descriptionLabel.text = description
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CharacterCollectionViewCell", bundle: nil)
    }

}
