//
//  SpecialEffectsBlursBlending.swift
//  path_1_
//
//  Created by kanishk vijaywargiya on 16/03/21.
//

import SwiftUI

struct SpecialEffectsBlursBlending: View {
    @State private var amount: CGFloat = 0.0
    
    var body: some View {
        VStack{
            Image("armstrong")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(Double(amount))
                .blur(radius: (1 - amount) * 20)
//            ZStack{
//                Circle()
//                    //.fill(Color.red)
//                    .fill(Color(red: 1, green: 0, blue: 0))
//                    .frame(width: 200 * amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(Color(red: 0, green: 1, blue: 0))
//                    .frame(width: 200 * amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(Color(red: 0, green: 0, blue: 1))
//                    .frame(width: 200 * amount)
//                    .blendMode(.screen)
//            }
//            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        //Image("armstrong")
        //  .colorMultiply(.red)
        //        ZStack{
        //            Image("armstrong")
        //            Rectangle()
        //                .fill(Color.red)
        //                .blendMode(.multiply)
        //        }
        //        .frame(width: 400, height: 300)
        //        .clipped()
    }
}

struct SpecialEffectsBlursBlending_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffectsBlursBlending()
    }
}
