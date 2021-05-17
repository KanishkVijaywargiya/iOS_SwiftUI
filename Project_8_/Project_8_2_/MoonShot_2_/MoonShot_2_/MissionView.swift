//
//  MissionView.swift
//  MoonShot_2_
//
//  Created by kanishk vijaywargiya on 13/03/21.
//

import SwiftUI

struct MissionView: View {
    @State private var hasTitle = true
    
    struct CrewMember{
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let astronauts: [CrewMember]
    
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        
        var matches = [CrewMember]()
        
        for member in mission.crew{
            if let match = astronauts.first(where: {$0.id == member.name}){
                print(match)
                matches.append(CrewMember(role: member.role, astronaut: match))
            }else{
                fatalError("Missing \(member)")
            }
        }
        self.astronauts = matches
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical,showsIndicators: false){
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.7)
                        .padding(.top)
                    
                    Text(self.mission.description)
                        .padding()
                    Text(self.mission.formatedLaunchDate)
                    
                    ForEach(self.astronauts, id:\.role){ crewMember in
                        NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut)
                                        .onAppear {
                                            self.hasTitle = false
                                        }
                                        .onDisappear {
                                            self.hasTitle = true
                                        }
                        ) {
                            HStack{
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width:83, height:60)
                                    .clipShape(Capsule())
                                    .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                                
                                VStack(alignment: .leading){
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    Spacer(minLength: 25)
                }
            }
        }
        .navigationBarTitle(self.hasTitle ? Text(mission.displayName): Text(""),displayMode: .inline)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let astronauts:[Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionView(mission: missions[0],astronauts: astronauts)
    }
}
