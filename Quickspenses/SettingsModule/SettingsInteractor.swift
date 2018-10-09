//
//  SettingsInteractor.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 09.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import Foundation

class SettingsInteractor: SettingsInteractorProtocol {
    
    weak var presenter: SettingsPresenterProtocol!
    
    required init(presenter: SettingsPresenterProtocol) {
        self.presenter = presenter
        
    }
}
