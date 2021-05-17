//
//  CoordGeometryReader.swift
//  Project_18_1_
//
//  Created by kanishk vijaywargiya on 16/04/21.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(Color.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                Text("Center")
                    .background(Color.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x\(geo.frame(in: .global).midY) ")
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x\(geo.frame(in: .named("Custom")).midY)")
                        print("Local center: \(geo.frame(in: .local).midX) x\(geo.frame(in: .local).midY)")
                    }
            }
            .background(Color.orange)
            Text("Right")
        }
    }
}

struct CoordGeometryReader: View {
    var body: some View {
        OuterView()
            .background(Color.red)
            .coordinateSpace(name: "Custom")
//        VStack {
//            GeometryReader { geo in
//                Text("Hello, World!")
//                    .frame(width: geo.size.width * 0.9, height: 40)
//                    .background(Color.red)
//            }
//            .background(Color.green)
//
//            Text("More text")
//                .background(Color.blue)
//        }
    }
}

struct CoordGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        CoordGeometryReader()
    }
}
