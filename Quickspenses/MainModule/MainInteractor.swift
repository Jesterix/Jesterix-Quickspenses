//
//  MainInteractor.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 07.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import Foundation
import CoreData


class MainInteractor: MainInteractorProtocol {
    
    weak var presenter: MainPresenterProtocol!
//    let serverService: ServerServiceProtocol = ServerService()
    var transactions : [Transaction] {
        get {
            return getDataFromCore()
        }
    }
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
        
    }
    
    func getDataFromCore() -> [Transaction]{
        let context = CoreDataManager.instance.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Entities.Transaction.rawValue)
        var transacts : [Transaction] = []
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [Transaction] {
                    transacts.append(result)
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
                CoreDataManager.instance.saveContext()
                transacts.append(testAction)
            }

        } catch {
            print(error)
        }
        return transacts
    }
    
//    var urlRatesSource: String {
//        get {
//            return serverService.urlRatesSource
//        }
//    }
    
//    func openUrl(with urlString: String) {
//        serverService.openUrl(with: urlString)
//    }
}
