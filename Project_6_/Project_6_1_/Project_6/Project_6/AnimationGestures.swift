//
//  AnimationGestures.swift
//  Project_6
//
//  Created by kanishk vijaywargiya on 07/03/21.
//

import SwiftUI

struct AnimationGestures: View {
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var dragAmount1 = CGSize.zero
    
    let letters = Array("Hello SwiftUI")
    
    var body: some View {
        
        VStack {
            HStack(spacing: 0) {
                ForEach(0..<letters.count) { num in
                    Text(String(self.letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(self.enabled ? Color.blue : Color.red)
                        .offset(self.dragAmount)
                        .animation(Animation.default.delay(Double(num) / 20))
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { self.dragAmount = $0.translation }
                    .onEnded { _ in
                        self.dragAmount = .zero
                        self.enabled.toggle()
                    }
            )
            
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragAmount1)
                .gesture(
                    DragGesture()
                        .onChanged { self.dragAmount1 = $0.translation }
                        .onEnded { _ in
                            // self.dragAmount = .zero
                            withAnimation(.spring()) {
                                self.dragAmount1 = .zero
                            }
                        }
                )
                .animation(.spring())
        }
    }
}

struct AnimationGestures_Previews: PreviewProvider {
    static var previews: some View {
        AnimationGestures()
    }
}
