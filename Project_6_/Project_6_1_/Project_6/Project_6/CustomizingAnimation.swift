//
//  CustomizingAnimation.swift
//  Project_6
//
//  Created by kanishk vijaywargiya on 06/03/21.
//

import SwiftUI

struct CustomizingAnimation: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Hello People!"){
            self.animationAmount += 1
        }
        .padding(50)
        .background(Color.blue)
        .foregroundColor(.white)
        .clipShape(Circle())
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
//        .animation(.easeInOut)
//        .animation(.interpolatingSpring(stiffness: 50, damping: 1))
//        .animation(.easeInOut(duration: 2))
//        .animation(Animation.easeInOut(duration: 2).delay(1))
//        .animation(Animation.easeInOut(duration: 2).repeatCount(3, autoreverses: true))
//        .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
        .overlay(
            Circle()
                .stroke(Color.blue)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
        )
        .onAppear{
            self.animationAmount = 2
        }
    }
}

struct CustomizingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingAnimation()
    }
}
