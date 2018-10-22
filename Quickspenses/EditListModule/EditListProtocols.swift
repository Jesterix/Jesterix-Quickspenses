//
//  EditListProtocols.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 09.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import Foundation
import CoreData

protocol EditListViewProtocol: class {
    var listToEdit : String { get set }

}

protocol EditListPresenterProtocol: class {
    var router: EditListRouterProtocol! { set get }
    func configureTableViewRows() -> Int
    func configureTextForRow(row: Int) -> String
    func editObjectInList(row: Int, newValue: String)
    func addObjectIntList(value: String)
    func validateInput(text: String) -> Bool
    func deleteObject(row: Int)
}

protocol EditListInteractorProtocol: class {
    var objects : [NSManagedObject] { get }
    func saveData()
    func addObject(data: String)
    func checkForValidity(objectName: String) -> Bool
    func deleteData(row: Int)
}

protocol EditListRouterProtocol: class {
    
}

protocol EditListConfiguratorProtocol: class {
    func configure(with viewController: EditListViewController)
}

protocol Nameable: class {
    var name: String? { get set }
}

