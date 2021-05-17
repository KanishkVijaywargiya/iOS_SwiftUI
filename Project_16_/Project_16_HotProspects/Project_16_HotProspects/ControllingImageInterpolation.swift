//
//  ControllingImageInterpolation .swift
//  Project_16_HotProspects
//
//  Created by kanishk vijaywargiya on 11/04/21.
//

import SwiftUI

struct ControllingImageInterpolation: View {
    var body: some View {
        Image("alien")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(Color.blue)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ControllingImageInterpolation_Previews: PreviewProvider {
    static var previews: some View {
        ControllingImageInterpolation()
    }
}
