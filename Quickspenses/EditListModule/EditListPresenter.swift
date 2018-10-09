//
//  EditListPresenter.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 09.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import Foundation

class EditListPresenter: EditListPresenterProtocol {
    
    weak var view: EditListViewProtocol!
    var interactor: EditListInteractorProtocol!
    var router: EditListRouterProtocol!
    
    required init(view: EditListViewProtocol) {
        self.view = view
    }
}
