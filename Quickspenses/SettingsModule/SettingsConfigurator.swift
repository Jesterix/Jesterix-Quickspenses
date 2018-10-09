//
//  SettingsConfigurator.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 09.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import Foundation
import UIKit

class SettingsConfigurator: SettingsConfiguratorProtocol {
    
    func configure(with viewController: SettingsViewController) {
        let presenter = SettingsPresenter(view: viewController)
        let interactor = SettingsInteractor(presenter: presenter)
        let router = SettingsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
