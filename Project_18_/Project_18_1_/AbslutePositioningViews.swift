//
//  AbslutePositioningViews.swift
//  Project_18_1_
//
//  Created by kanishk vijaywargiya on 16/04/21.
//

import SwiftUI

struct AbslutePositioningViews: View {
    var body: some View {
        Text("Hello, World!")
            //.position(x: 100, y: 100)
            .background(Color.red)
            .offset(x: 100, y: 100)
    }
}

struct AbslutePositioningViews_Previews: PreviewProvider {
    static var previews: some View {
        AbslutePositioningViews()
    }
}
