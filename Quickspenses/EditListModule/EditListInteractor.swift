//
//  EditListInteractor.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 09.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import Foundation
import CoreData

class EditListInteractor: EditListInteractorProtocol {
    
    weak var presenter: EditListPresenterProtocol!
    
    var objects : [NSManagedObject] {
        get {
            return getDataFromCore()
        }
    }
    
    var listToEdit : String
    
    required init(presenter: EditListPresenterProtocol, listToEdit: String) {
        self.presenter = presenter
        self.listToEdit = listToEdit
    }
    
    func getDataFromCore() -> [NSManagedObject]{
        let context = CoreDataManager.instance.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: listToEdit)
        var objectsFromDataBase : [NSManagedObject] = []
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    objectsFromDataBase.append(result)
                }
            }
                //MARK: - добавим тестовую трансакцию для разработки
            else {
                let testAction = Transaction()
                let purpose = Purpose()
                let wallet = Wallet()
                testAction.date = NSDate.init(timeIntervalSinceNow: 0)
                testAction.sum = 1000.45
                purpose.name = "расходы"
                testAction.purpose = purpose.name
                wallet.name = "кошелек"
                testAction.wallet = wallet.name
                testAction.comment = "комментарий"
                objectsFromDataBase.append(purpose)
                CoreDataManager.instance.saveContext()
            }
            
        } catch {
            print(error)
        }
        return objectsFromDataBase
    }
    
    func saveData(){
        CoreDataManager.instance.saveContext()
    }
    
    
    func addObject(data: String){
        switch listToEdit {
        case Entities.Purpose.rawValue:
            let newPurpose = Purpose()
            newPurpose.name = data
        case Entities.Wallet.rawValue:
            let newWallet = Wallet()
            newWallet.name = data
        default:
            break
        }
        saveData()
    }
    
    
    func checkForValidity(objectName: String) -> Bool {
        guard let objs = objects as? [Nameable] else { return false }
        var isDataUnique = true
        for object in objs {
            if objectName == object.name {
                isDataUnique = false
                break
            }
        }
        return isDataUnique
    }
    
    
    func deleteData(row: Int) {
        if let objs = objects as? [Nameable] {
            guard let name = objs[row].name else { return }
            CoreDataManager.instance.deleteNameableObject(entityName: listToEdit, nameOfObjectToDelete: name)
            
        }
    }
}
