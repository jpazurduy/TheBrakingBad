//
//  GlobalProgressHUD.swift
//  TheBreakinBad
//
//  Created by AvanticaMAC2 on 2/4/21.
//

import Foundation
import JGProgressHUD

class GlobalProgressHUD {
    
    static private let hud: JGProgressHUD = {
       let hud = JGProgressHUD()
       hud.textLabel.text = "Loading"
       return hud
   }()
    
    static func show(viewController: UIViewController) {
        hud.show(in: viewController.view)
    }
    
    static func hide() {
        hud.dismiss(animated: true)
    }
}
