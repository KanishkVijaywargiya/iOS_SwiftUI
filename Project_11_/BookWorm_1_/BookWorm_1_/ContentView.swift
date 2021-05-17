//
//  ContentView.swift
//  BookWorm_1_
//
//  Created by kanishk vijaywargiya on 20/03/21.
//

import SwiftUI

struct ContentView: View {
    let context = Persistent.persistentContainer.viewContext
    var body: some View {
        CombineCoreDataWithSwiftUI()
            .environment(\.managedObjectContext, context)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
