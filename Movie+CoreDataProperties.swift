//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Eugene on 01/09/2023.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16
    
    public var wrappedTitle: String { // keep nil coalescing in one place
        title ?? "Unknown title"
    }

}

extension Movie : Identifiable {

}
