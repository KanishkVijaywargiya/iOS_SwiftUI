//
//  LayoutWorks.swift
//  Project_18_1_
//
//  Created by kanishk vijaywargiya on 16/04/21.
//

import SwiftUI

struct LayoutWorks: View {
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("Number \(position)")
                    .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
            }
        }
        .background(Color.red)
        .frame(width: 400, height: 400)
        .background(Color.blue)
        
        //        VStack(alignment: .leading) {
        //            Text("Hello, world!")
        //                .alignmentGuide(.leading) { d in d[.leading] }
        //            Text("This is a longer line of text")
        //        }
        //        .background(Color.red)
        //        .frame(width: 400, height: 400)
        //        .background(Color.blue)
        
        //        HStack(alignment: .lastTextBaseline) {
        //            Text("Live")
        //                .font(.caption)
        //            Text("long")
        //                .font(.title)
        //            Text("and")
        //                .font(.title)
        //            Text("prosper")
        //                .font(.largeTitle)
        //        }
        
        //Color.green
        //.edgesIgnoringSafeArea(.all)
        
        //Text("Live long and prosper")
        //.frame(width: 300, height: 300, alignment: .topLeading)
    }
}

struct LayoutWorks_Previews: PreviewProvider {
    static var previews: some View {
        LayoutWorks()
    }
}
