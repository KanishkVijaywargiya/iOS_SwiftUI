//
//  HotProspects.swift
//  Progect_16_2_
//
//  Created by kanishk vijaywargiya on 12/04/21.
//

import SwiftUI

struct HotProspects: View {
    var prospects = Prospects()
    
    var body: some View {
        TabView{
            ProspectsView(filter: .none)
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Everyone")
                }
            ProspectsView(filter: .contacted)
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("Contacted")
                }
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Image(systemName: "questionmark.diamond")
                    Text("UnContacted")
                }
            MeView()
                .tabItem {
                    Image(systemName: "person.crop.square")
                    Text("Me")
                }
        }
        .environmentObject(prospects)
    }
}

struct HotProspects_Previews: PreviewProvider {
    static var previews: some View {
        HotProspects()
    }
}
