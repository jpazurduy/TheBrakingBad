//
//  DeathPresenter.swift
//  TheBreakinBad
//
//  Created by AvanticaMAC2 on 2/10/21.
//

import Foundation
protocol DeathPresenterView: class {
    func retrieveDeath(withID: String)
}

class DeathPresenter {
    weak var view: DeathPresenterView?
    
    init(viewController: DeathsTableViewController) {
        self.view = viewController
    }
    
    func plainData(death: DeathInformation) -> [String] {
        var array = [String]()
        array.append(death.death ?? "")
        array.append(death.cause ?? "")
        array.append(death.responsible ?? "")
        array.append(death.lastWords ?? "")
        array.append(death.season?.description ?? "0")
        array.append(death.episode?.description ?? "0")
        array.append(death.numOfDeaths?.description ?? "0")
        return array
    }
}
