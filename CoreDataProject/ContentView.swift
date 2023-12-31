//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Eugene on 01/09/2023.
//
import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    enum predicateFilter: String {
        case notBeginsWith = "not %K BEGINSWITH %@"
        case beginsWith = "%K BEGINSWITH %@"
        case contains = "%K CONTAINS %@"
        case containsC = "% K CONTAINS[c] %@"
    }
    

    let singerSortDescriptors: [SortDescriptor<Singer>] = [SortDescriptor(\.lastName)]
//     let sortDescriptors = [SortDescriptor(\Singer.firstName)] // without explicit typing
    
    var body: some View {
        VStack {
            
            // note closure has the tuple as need to show the specific type of NSManagedObject as we are using generics
            FilteredList(filterKey: "lastName",
                         filterValue: lastNameFilter,
                         sortDescriptors: singerSortDescriptors,
                         filterPredicate: predicateFilter.beginsWith.rawValue) { (singer: Singer)  in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
              let taylor = Singer(context: moc)
              taylor.firstName = "Taylor"
              taylor.lastName = "Swift"
                

              let ed = Singer(context: moc)
              ed.firstName = "Ed"
              ed.lastName = "Sheeran"

              let adele = Singer(context: moc)
              adele.firstName = "Adele"
              adele.lastName = "Adkins"
                
              let cat = Singer(context: moc)
              cat.firstName = "Cat"
              cat.lastName = "Stevens"

              try? moc.save()
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }

            Button("Show S") {
                lastNameFilter = "S"
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
