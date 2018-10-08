//
//  MainRouter.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 07.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import Foundation
import UIKit

class MainRouter: MainRouterProtocol {
    
    weak var viewController: MainViewController!
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
//    func closeCurrentViewController() {
//        viewController.dismiss(animated: true, completion: nil)
//    }
}
