//
//  CharacterDetailPresenter.swift
//  TheBreakinBad
//
//  Created by AvanticaMAC2 on 2/10/21.
//

import Foundation

protocol CharacterDetailPresenterView {
    func selectedCharacter(character: Character)
}

class CharacterDetailPresenter {
    
    weak var view: CharacterDetailViewController?
    
    init(viewController: CharacterDetailViewController) {
        self.view = viewController
    }
    
    func showCharacterDetails(character: Character) {
        view?.selectedCharacter(character: Character())
    }
    
    
}
