//
//  CustomComponentWithBinding.swift
//  BookWorm_1_
//
//  Created by kanishk vijaywargiya on 20/03/21.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View{
        Button(title){
            self.isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct CustomComponentWithBinding: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButton(title: "Rememberme", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
//        Toggle(isOn: $rememberMe){
//            Text("Remember me!")
//        }
    }
}

struct CustomComponentWithBinding_Previews: PreviewProvider {
    static var previews: some View {
        CustomComponentWithBinding()
    }
}
