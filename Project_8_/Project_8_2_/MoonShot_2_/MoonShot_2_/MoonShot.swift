//
//  MoonShot.swift
//  MoonShot_2_
//
//  Created by kanishk vijaywargiya on 13/03/21.
//

import SwiftUI

struct MoonShot: View {
    
    @State private var hasTitle = true
    
    let astronauts:[Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            List(missions){ mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)
                                .onAppear {
                                    self.hasTitle = false
                                }
                                .onDisappear {
                                    self.hasTitle = true
                                }
                ){
                    Image(mission.image)
                        .resizable()
                        //                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading){
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formatedLaunchDate)
                    }
                }
            }
            .navigationBarTitle(self.hasTitle ? "Moonshot" : "")
        }
    }
}

struct MoonShot_Previews: PreviewProvider {
    static var previews: some View {
        MoonShot()
    }
}
