//
//  EnsuringCoreDataObjectsAreUniqueUsingCOnstraints.swift
//  Project_12_1
//
//  Created by kanishk vijaywargiya on 23/03/21.
//

import SwiftUI
import CoreData

struct EnsuringCoreDataObjectsAreUniqueUsingCOnstraints: View {
    @Environment(\.managedObjectContext) var moc1
    
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: [])
    var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards, id:\.self){wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add"){
                let wizard = Wizard(context: self.moc1)
                wizard.name = "Hurry Putter"
            }
            
            Button("Save"){
                do{
                    try self.moc1.save()
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct EnsuringCoreDataObjectsAreUniqueUsingCOnstraints_Previews: PreviewProvider {
    static var previews: some View {
        EnsuringCoreDataObjectsAreUniqueUsingCOnstraints()
    }
}
