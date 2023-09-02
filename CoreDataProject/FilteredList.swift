//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Eugene on 01/09/2023.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }
    // @escaping means closure is not run straight away, but stashed for later. @ViewBuilder prop wrapper
    init(filterKey: String, filterValue: String, filterPredicate: String, @ViewBuilder content: @escaping (T) -> Content) {
        
        // _fetchRequest modifies the Fetch request object not the value next to the propety wrapper
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "\(filterPredicate)", filterKey, filterValue))
        self.content = content
    }
}
