//
//  ControllingAnimationStack.swift
//  Project_6
//
//  Created by kanishk vijaywargiya on 07/03/21.
//

import SwiftUI

struct ControllingAnimationStack: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
    }
}

struct ControllingAnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        ControllingAnimationStack()
    }
}
