//
//  IntegratingCoreImageWithSwiftUI.swift
//  InstaFilter
//
//  Created by kanishk vijaywargiya on 27/03/21.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct IntegratingCoreImageWithSwiftUI: View {
    @State private var image: Image?
    var body: some View {
        VStack{
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImg)
    }
    
    func loadImg() {
        //        image = Image("example")
        guard let inputImage = UIImage(named: "example") else { return }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        
        //let currentFilter = CIFilter.sepiaTone()
        //let currentFilter = CIFilter.pixellate()
        //let currentFilter = CIFilter.crystallize()
        
        //old api
        //currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        // new api
        //currentFilter.inputImage = beginImage
        
        //currentFilter.intensity = 1
        //currentFilter.scale = 100
        //currentFilter.radius = 200
        
        guard let currentFilter = CIFilter(name: "CITwirlDistortion") else { return }
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter.setValue(200, forKey: kCIInputRadiusKey)
        currentFilter.setValue(CIVector(x: inputImage.size.width / 2, y: inputImage.size.height / 2), forKey: kCIInputCenterKey)
        
        // get a CIImage from our filter or exit if that fails
        guard let outputImage = currentFilter.outputImage else { return }
        
        // attempt to get a CGImage from our CIImage
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            // convert that to a UIImage
            let uiImage = UIImage(cgImage: cgimg)
            // and convert that to a SwiftUI image
            image = Image(uiImage: uiImage)
        }
    }
}

struct IntegratingCoreImageWithSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        IntegratingCoreImageWithSwiftUI()
    }
}


/**
 Apart from SwiftUI’s Image view, the three other image types are:
 
 1]. UIImage, which comes from UIKit. This is an extremely powerful image type capable of working with a variety of image types, including bitmaps (like PNG), vectors (like SVG), and even sequences that form an animation. UIImage is the standard image type for UIKit, and of the three it’s closest to SwiftUI’s Image type.
 
 2]. CGImage, which comes from Core Graphics. This is a simpler image type that is really just a two-dimensional array of pixels.
 
 3]. CIImage, which comes from Core Image. This stores all the information required to produce an image but doesn’t actually turn that into pixels unless it’s asked to. Apple calls CIImage “an image recipe” rather than an actual image.
 
 
 There is some interoperability between the various image types:
 
 1]. We can create a UIImage from a CGImage, and create a CGImage from a UIImage.
 
 2]. We can create a CIImage from a UIImage and from a CGImage, and can create a CGImage from a CIImage.
 
 3]. We can create a SwiftUI Image from both a UIImage and a CGImage.
 
 */
