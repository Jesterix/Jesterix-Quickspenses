//
//  SettingsRouter.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 09.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import Foundation
import UIKit

class SettingsRouter: SettingsRouterProtocol {
    
    weak var viewController: SettingsViewController!
    
    init(viewController: SettingsViewController) {
        self.viewController = viewController
    }
    
    func showEditListScene(objectToEdit: Entities){
        viewController.performSegue(withIdentifier: viewController.settingsToEditListSegueName, sender: objectToEdit)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditListViewProtocol {
            if let objectToEdit = sender as? Entities {
                vc.listToEdit = objectToEdit.rawValue
            }
        } else {
            print("segue error")
        }
    }
    
}
