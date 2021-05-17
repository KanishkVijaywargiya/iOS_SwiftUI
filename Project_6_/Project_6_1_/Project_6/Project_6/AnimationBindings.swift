//
//  AnimationBindings.swift
//  Project_6
//
//  Created by kanishk vijaywargiya on 07/03/21.
//

import SwiftUI

struct AnimationBindings: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                Animation.easeInOut(duration: 1).repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap me"){
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(Color.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct AnimationBindings_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBindings()
    }
}
