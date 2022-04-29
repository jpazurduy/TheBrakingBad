//
//  SelectedCategoryInfoTableViewController.swift
//  TheBreakingBad
//
//  Created by AvanticaMAC2 on 1/28/21.
//

import UIKit


class CharactersCollectionViewController: UICollectionViewController {

    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow: CGFloat = 2
    
    var characters = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.title = "Characteres"
        collectionView.register(CharacterCollectionViewCell.nib(), forCellWithReuseIdentifier: CharacterCollectionViewCell.identifier)
      
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.identifier, for: indexPath) as! CharacterCollectionViewCell
        
        cell.backgroundColor = #colorLiteral(red: 0.7209444642, green: 0.7209444642, blue: 0.7209444642, alpha: 1)
        
        if let img = characters[indexPath.row].img, let name = characters[indexPath.row].name, let nickName = characters[indexPath.row].nickName {
            cell.configure(imageURL: img, name: name, description: nickName)
        }
        
        cell.cellTuning()
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        GlobalProgressHUD.show(viewController: self)
        
        let storyboard = UIStoryboard(name: "CharacterDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "detailCharacter") as! CharacterDetailViewController
        let selected = characters[indexPath.row]
        viewController.selectedCharacter = selected
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
}

extension CharactersCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
            
        return CGSize(width: widthPerItem, height: widthPerItem + 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.left
    }
}

