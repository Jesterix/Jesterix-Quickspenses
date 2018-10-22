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
    
    func configureTableViewRows() -> Int {
        return interactor.objects.count
    }
    
    func configureTextForRow(row: Int) -> String {
        if let object = interactor.objects[row] as? Nameable {
            return object.name ?? "-"
        } else {
            return "No text in database"
        }
    }
    
    func editObjectInList(row: Int, newValue: String) {
        if let object = interactor.objects[row] as? Nameable {
            object.name = newValue
            interactor.saveData()
        }
    }
    
    func addObjectIntList(value: String) {
        interactor.addObject(data: value)
    }
    
    func validateInput(text: String) -> Bool{
        return interactor.checkForValidity(objectName: text)
    }
    
    func deleteObject(row: Int) {
        interactor.deleteData(row: row)
    }
}
