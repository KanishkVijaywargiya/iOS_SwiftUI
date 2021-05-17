//
//  ContentView.swift
//  Project_12_1
//
//  Created by kanishk vijaywargiya on 23/03/21.
//

import SwiftUI

struct ContentView: View {
    let context = Persistent.persistentContainer.viewContext
    var body: some View {
        OneToManyRelationship()
            .environment(\.managedObjectContext, context)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
