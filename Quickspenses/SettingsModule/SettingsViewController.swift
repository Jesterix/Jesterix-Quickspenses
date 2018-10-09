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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func editPurposeTapped(_ sender: Any) {
    }
    
    @IBAction func editWalletTapped(_ sender: Any) {
    }
    
    
    
}
