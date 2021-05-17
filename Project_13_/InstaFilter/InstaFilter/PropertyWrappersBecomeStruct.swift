//
//  PropertyWrappersBecomeStruct.swift
//  InstaFilter
//
//  Created by kanishk vijaywargiya on 27/03/21.
//

import SwiftUI

struct PropertyWrappersBecomeStruct: View {
    @State private var blurAmount: CGFloat = 0 {
        didSet{
            print("new values is \(blurAmount)")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            Slider(value: $blurAmount, in: 0...20)
        }
    }
}

struct PropertyWrappersBecomeStruct_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrappersBecomeStruct()
    }
}
