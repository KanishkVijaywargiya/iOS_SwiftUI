//
//  SizeClassesWithAnyView.swift
//  BookWorm_1_
//
//  Created by kanishk vijaywargiya on 20/03/21.
//

import SwiftUI

struct SizeClassesWithAnyView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact{
            return AnyView(VStack {
                Text("Active Size Class:")
                Text("COMPACT")
            }
            .font(.largeTitle))
        }else{
            return AnyView(HStack{
                Text("Active size class:")
                Text("REGULAR")
            }
            .font(.largeTitle))
        }
    }
}

struct SizeClassesWithAnyView_Previews: PreviewProvider {
    static var previews: some View {
        SizeClassesWithAnyView()
    }
}
