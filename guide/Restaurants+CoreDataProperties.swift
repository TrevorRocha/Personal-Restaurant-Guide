//
//  Restaurants+CoreDataProperties.swift
//  guide
//
//  Created by Trevor Rocha on 2021-04-19.
//
//

import Foundation
import CoreData


extension Restaurants {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Restaurants> {
        return NSFetchRequest<Restaurants>(entityName: "Restaurants")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var descriptions: String?
    @NSManaged public var tag: String?

}

extension Restaurants : Identifiable {

}
