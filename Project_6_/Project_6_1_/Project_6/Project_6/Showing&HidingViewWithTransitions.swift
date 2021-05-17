//
//  Showing&HidingViewWithTransitions.swift
//  Project_6
//
//  Created by kanishk vijaywargiya on 07/03/21.
//

import SwiftUI

struct Showing_HidingViewWithTransitions: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation{
                    self.isShowingRed.toggle()
                }
            }
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct Showing_HidingViewWithTransitions_Previews: PreviewProvider {
    static var previews: some View {
        Showing_HidingViewWithTransitions()
    }
}
