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
   
    var body: some View {
        VStack {
            
            // note closure has the tuple as need to show the specific type of NSManagedObject as we are using generics
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer)  in
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
