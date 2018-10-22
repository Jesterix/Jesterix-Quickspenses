//
//  SettingsProtocols.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 09.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsViewProtocol: class {

}

protocol SettingsPresenterProtocol: class {
    var router: SettingsRouterProtocol! { set get }
    func editButtonTapped(objectToEdit: Entities)
}

protocol SettingsInteractorProtocol: class {

}

protocol SettingsRouterProtocol: class {
    func showEditListScene(objectToEdit: Entities)
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

protocol SettingsConfiguratorProtocol: class {
    func configure(with viewController: SettingsViewController)
}
