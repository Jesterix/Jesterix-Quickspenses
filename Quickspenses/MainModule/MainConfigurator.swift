//
//  MainConfigurator.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 07.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import Foundation
import UIKit

class MainConfigurator: MainConfiguratorProtocol {
    
    func configure(with viewController: MainViewController) {
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter)
        let router = MainRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
