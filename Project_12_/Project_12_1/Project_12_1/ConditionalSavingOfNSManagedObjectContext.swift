//
//  ConditionalSavingOfNSManagedObjectContext.swift
//  Project_12_1
//
//  Created by kanishk vijaywargiya on 23/03/21.
//

import SwiftUI

struct ConditionalSavingOfNSManagedObjectContext: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Button("Save"){
            if self.moc.hasChanges {
                try? self.moc.save()
            }
        }
    }
}

struct ConditionalSavingOfNSManagedObjectContext_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalSavingOfNSManagedObjectContext()
    }
}
