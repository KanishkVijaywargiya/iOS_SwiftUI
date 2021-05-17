//
//  CreativeBorders&FIlls.swift
//  path_1_
//
//  Created by kanishk vijaywargiya on 15/03/21.
//

import SwiftUI

struct CreativeBorders_FIlls: View {
    var body: some View {
        Capsule()
            .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 200)
        
        //Text("Hello World")
          //  .frame(width: 300, height: 300)
            //.border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, //width: 1, height: 0.5), scale: 0.1), width: 30)
        
        //Text("Hello World")
          //  .frame(width: 300, height: 300)
            //.border(ImagePaint(image: Image("Example"), scale: 0.2), width: 30)

        //Text("Hello World")
          //  .frame(width: 300, height: 300)
            //.border(Image("Example"), width: 30)
        
        //Text("Hello World")
          //  .frame(width: 300, height: 300)
            //.background(Image("Example"))
        
        //Text("Hello World")
          //  .frame(width: 300, height: 300)
            //.border(Color.red, width: 30)
        
        //Text("Hello World")
          //  .frame(width: 300, height: 300)
            //.background(Color.red)
    }
}

struct CreativeBorders_FIlls_Previews: PreviewProvider {
    static var previews: some View {
        CreativeBorders_FIlls()
    }
}
