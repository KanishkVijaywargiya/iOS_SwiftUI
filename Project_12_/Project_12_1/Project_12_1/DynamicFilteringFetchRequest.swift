//
//  DynamicFilteringFetchRequest.swift
//  Project_12_1
//
//  Created by kanishk vijaywargiya on 24/03/21.
//

import SwiftUI

struct DynamicFilteringFetchRequest: View {
    @Environment(\.managedObjectContext) var moc3
    @State private var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            // list of matching singers
//            FilteredLIst(filter: lastNameFilter)
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter){ (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: self.moc3)
                taylor.fisrtName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: self.moc3)
                ed.fisrtName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: self.moc3)
                adele.fisrtName = "Adele"
                adele.lastName = "Adkins"
                
                try? self.moc3.save()
            }
            
            Button("Show A") {
                self.lastNameFilter = "A"
            }
            
            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
    }
}
struct DynamicFilteringFetchRequest_Previews: PreviewProvider {
    static var previews: some View {
        DynamicFilteringFetchRequest()
    }
}
