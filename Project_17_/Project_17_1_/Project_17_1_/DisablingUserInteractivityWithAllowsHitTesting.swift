//
//  DisablingUserInteractivityWithAllowsHitTesting.swift
//  Project_17_1_
//
//  Created by kanishk vijaywargiya on 13/04/21.
//

import SwiftUI

struct DisablingUserInteractivityWithAllowsHitTesting: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            
            Circle()
                .fill(Color.red)
                .frame(width: 300, height: 300)
                .contentShape(Rectangle())
                .onTapGesture {
                    print("Circle tapped!")
                }
            // .allowsHitTesting(false)
            
            VStack {
                Text("Hello")
                Spacer().frame(height: 100)
                Text("World")
            }
            .contentShape(Rectangle())
            .onTapGesture {
                print("VStack tapped!")
            }
        }
    }
}

struct DisablingUserInteractivityWithAllowsHitTesting_Previews: PreviewProvider {
    static var previews: some View {
        DisablingUserInteractivityWithAllowsHitTesting()
    }
}
