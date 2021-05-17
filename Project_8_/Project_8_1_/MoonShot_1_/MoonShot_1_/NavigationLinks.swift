//
//  NavigationLinks.swift
//  MoonShot_1_
//
//  Created by kanishk vijaywargiya on 13/03/21.
//

import SwiftUI

struct NavigationLinks: View {
    var body: some View {
        NavigationView{
            VStack{
                List(0..<100) { row in
                    NavigationLink(destination: Text("Detail \(row)")){
                        Text("Hello World! \(row)")
                    }
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct NavigationLinks_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinks()
    }
}
