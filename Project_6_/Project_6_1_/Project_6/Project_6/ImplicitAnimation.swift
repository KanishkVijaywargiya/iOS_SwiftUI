//
//  ImplicitAnimation.swift
//  Project_6
//
//  Created by kanishk vijaywargiya on 06/03/21.
//

import SwiftUI

struct ImplicitAnimation: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap Me"){
            self.animationAmount += 1
        }
        .padding(50)
        .background(Color.blue)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.easeInOut)
    }
}

struct ImplicitAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimation()
    }
}
