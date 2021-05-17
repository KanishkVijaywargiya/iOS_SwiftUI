//
//  Movie+CoreDataProperties.swift
//  Project_12_1
//
//  Created by kanishk vijaywargiya on 23/03/21.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var year: Int16
    @NSManaged public var director: String?
    
    public var wrappedTitle: String {
        return title ?? "Unknown title"
    }

}

extension Movie : Identifiable {

}
