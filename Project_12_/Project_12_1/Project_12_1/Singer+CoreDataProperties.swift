//
//  Singer+CoreDataProperties.swift
//  Project_12_1
//
//  Created by kanishk vijaywargiya on 24/03/21.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var fisrtName: String?
    @NSManaged public var lastName: String?

    var wrappedFirstName: String {
        fisrtName ?? "Unknown"
    }
    
    var wrappedLastName: String {
        lastName ?? "Unknown"
    }
}

extension Singer : Identifiable {

}
