//
//  Wallet+CoreDataClass.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 07.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//
//

import Foundation
import CoreData


public class Wallet: NSManagedObject {

    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "Wallet"), insertInto: CoreDataManager.instance.persistentContainer.viewContext)
    }
    
}
