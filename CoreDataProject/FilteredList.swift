//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Eugene on 01/09/2023.
//

import SwiftUI
import CoreData

struct FilteredList: View {
    
    @FetchRequest var fetchRequest: FetchedResults<Singer>
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(filter: String) {
        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}

