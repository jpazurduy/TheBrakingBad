//
//  EpisodesPresenter.swift
//  TheBreakinBad
//
//  Created by AvanticaMAC2 on 2/9/21.
//

import Foundation

protocol EpisodesPresenterView: class {
    func retrieveEpisodes(episodes: [Episode])
    func retrieveEpisodesError(error: WebError)
}

class EpisodesPresenter {
    
    weak var view: EpisodesPresenterView?
    
    init(viewController: EpisodesTableViewController) {
        self.view = viewController
    }
    
    func plainData(episode: Episode) -> [String] {
        var array = [String]()
        array.append(episode.title ?? "")
        array.append(episode.season ?? "")
        array.append(episode.airDate ?? "")
        array.append(episode.characters?.joined(separator: "\n") ?? "")
        array.append(episode.episode ?? "")
        array.append(episode.series ?? "")
        return array
    }
    
  
}
