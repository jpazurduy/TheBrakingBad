//
//  CategoryPresenter.swift
//  TheBreakingBad
//
//  Created by AvanticaMAC2 on 1/28/21.
//

import Foundation

class CategoryPresenter {
    
    
    weak var view: CategoryView?
    
    init(viewController: CategoryView) {
        self.view = viewController
    }
    
    func requestCharacters() {
        WebService.requestCharacters() { response in
            switch response {
            case .success(let value):
                print(value)
                self.view?.showCharacters(characters: value)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    func requestEpisodes() {
        WebService.requestEpisodes() { response in
            switch response {
            case .success(let value):
                print(value)
                self.view?.showEpisodes(episodes: value)
            case .failure(let error):
                print(error.localizedDescription)
            }

        }
    }
    
    func requestDeaths() {
        WebService.requestDeaths() { response in
            switch response {
            case .success(let value):
                print(value)
                self.view?.showDeaths(deaths: value)
            case .failure(let error):
                print(error.localizedDescription)
            }

        }
    }
}
