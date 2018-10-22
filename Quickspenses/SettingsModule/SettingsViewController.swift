//
//  SettingsViewController.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 09.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, SettingsViewProtocol {

    var presenter: SettingsPresenterProtocol!
    let configurator: SettingsConfiguratorProtocol = SettingsConfigurator()
    let settingsToEditListSegueName = "settingsToEditListSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)

        // Do any additional setup after loading the view.
    }

    
    @IBAction func editPurposeTapped(_ sender: Any) {
        presenter.editButtonTapped(objectToEdit: Entities.Purpose)
    }
    
    @IBAction func editWalletTapped(_ sender: Any) {
        presenter.editButtonTapped(objectToEdit: Entities.Wallet)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.router.prepare(for: segue, sender: sender)
    }
    
}
