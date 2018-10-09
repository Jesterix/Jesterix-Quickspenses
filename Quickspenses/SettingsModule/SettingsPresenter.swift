//
//  SettingsPresenter.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 09.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import Foundation

class SettingsPresenter: SettingsPresenterProtocol {
    
    weak var view: SettingsViewProtocol!
    var interactor: SettingsInteractorProtocol!
    var router: SettingsRouterProtocol!
    
    required init(view: SettingsViewProtocol) {
        self.view = view
    }
}
