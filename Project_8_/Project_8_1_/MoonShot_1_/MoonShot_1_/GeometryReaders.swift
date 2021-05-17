//
//  GeometryReaders.swift
//  MoonShot_1_
//
//  Created by kanishk vijaywargiya on 13/03/21.
//

import SwiftUI

struct GeometryReaders: View {
    var body: some View {
        VStack{
            GeometryReader { geo in
                Image("testImg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }
                //.clipped()
        }
    }
}

struct GeometryReaders_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaders()
    }
}
