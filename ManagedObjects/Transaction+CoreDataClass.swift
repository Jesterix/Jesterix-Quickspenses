//
//  Transaction+CoreDataClass.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 07.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Transaction)
public class Transaction: NSManagedObject {

    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "Transaction"), insertInto: CoreDataManager.instance.persistentContainer.viewContext)
    }
}
