//
//  EditListInteractor.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 09.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import Foundation

class EditListInteractor: EditListInteractorProtocol {
    
    weak var presenter: EditListPresenterProtocol!
    
    required init(presenter: EditListPresenterProtocol) {
        self.presenter = presenter
        
    }
}
