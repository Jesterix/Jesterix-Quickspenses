//
//  Transaction+CoreDataProperties.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 07.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var sum: Double
    @NSManaged public var purpose: String?
    @NSManaged public var wallet: String?
    @NSManaged public var comment: String?

}
