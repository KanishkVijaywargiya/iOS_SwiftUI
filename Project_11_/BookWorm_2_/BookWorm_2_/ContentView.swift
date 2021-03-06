//
//  ContentView.swift
//  BookWorm_2_
//
//  Created by kanishk vijaywargiya on 21/03/21.
//

import SwiftUI

struct ContentView: View {
    let context = Persistent.persistentContainer.viewContext
    
    var body: some View {
        BookWorm()
            .environment(\.managedObjectContext, context)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
