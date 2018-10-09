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
    
    
}
