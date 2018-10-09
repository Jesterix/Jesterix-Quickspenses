//
//  EditListRouter.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 09.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import Foundation
import UIKit

class EditListRouter: EditListRouterProtocol {
    
    weak var viewController: EditListViewController!
    
    init(viewController: EditListViewController) {
        self.viewController = viewController
    }
    
    
}
