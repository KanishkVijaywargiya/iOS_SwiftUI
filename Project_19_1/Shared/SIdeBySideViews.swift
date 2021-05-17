//
//  2SIdeBySideViews.swift
//  Project_19_1
//
//  Created by KANISHK VIJAYWARGIYA on 19/04/21.
//

import SwiftUI

struct SIdeBySideViews: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("New Secondary")) {
                Text("Hello, World!")
            }
            .navigationBarTitle("Primary")
            Text("Secondary")
        }
    }
}

struct SIdeBySideViews_Previews: PreviewProvider {
    static var previews: some View {
        SIdeBySideViews()
    }
}
