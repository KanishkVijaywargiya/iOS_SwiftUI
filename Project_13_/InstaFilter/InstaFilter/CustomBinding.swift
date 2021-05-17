//
//  CustomBinding.swift
//  InstaFilter
//
//  Created by kanishk vijaywargiya on 27/03/21.
//

import SwiftUI

struct CustomBinding: View {
    @State private var blurAmount: CGFloat = 0
    
    var body: some View {
        let blur = Binding<CGFloat>(
            get:{
                self.blurAmount
            },
            set:{
                self.blurAmount = $0
                print("new values is \(self.blurAmount)")
            }
        )
        
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            Slider(value: blur, in: 0...20)
        }
    }
}

struct CustomBinding_Previews: PreviewProvider {
    static var previews: some View {
        CustomBinding()
    }
}
