//
//  TransparentLayoutContainersUsingGroups.swift
//  Project_19_1
//
//  Created by KANISHK VIJAYWARGIYA on 19/04/21.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Kanishk Vijaywargiya")
            Text("Country: India")
            Text("Pets: Luna, Arya and Toby")
        }
    }
}

struct TransparentLayoutContainersUsingGroups: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    // @State private var layoutVertically = false
    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack(content: UserView.init)
                // VStack {
                   // UserView()
                // }
            } else {
                HStack(content: UserView.init)
            }
        }
        // .onTapGesture {
           // self.layoutVertically.toggle()
        // }
    }
}

struct TransparentLayoutContainersUsingGroups_Previews: PreviewProvider {
    static var previews: some View {
        TransparentLayoutContainersUsingGroups()
    }
}
