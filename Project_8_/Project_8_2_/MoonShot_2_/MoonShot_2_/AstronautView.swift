//
//  AstronautView.swift
//  MoonShot_2_
//
//  Created by kanishk vijaywargiya on 13/03/21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        GeometryReader{ geo in
            ScrollView(.vertical,showsIndicators: false){
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width:geo.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
//                        .layoutPriority(1)
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name),displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts:[Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
