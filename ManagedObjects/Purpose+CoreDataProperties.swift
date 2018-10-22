//
//  Purpose+CoreDataProperties.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 07.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//
//

import Foundation
import CoreData


extension Purpose : Nameable  {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Purpose> {
        return NSFetchRequest<Purpose>(entityName: "Purpose")
    }

    @NSManaged public var name: String?

}
