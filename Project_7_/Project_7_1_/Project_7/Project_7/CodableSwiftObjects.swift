//
//  CodableSwiftObjects.swift
//  Project_7
//
//  Created by kanishk vijaywargiya on 07/03/21.
//

import SwiftUI

// Swift gives us a fantastic protocol called Codable: protocol specifically for archiving & unarchiving data, which is a fancy way of saying "converting objects into plain text & vice versa..."

// step1: Codable protocol
struct User2: Codable {
    var firstName: String
    var lastName: String
}

struct CodableSwiftObjects: View {
    @State private var user = User2(firstName: "Kanishk", lastName: "Vijaywargiya")
    
    var body: some View {
        VStack {
            Button("Save User"){
                // step2: encoding
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(self.user){
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
        }
    }
}

struct CodableSwiftObjects_Previews: PreviewProvider {
    static var previews: some View {
        CodableSwiftObjects()
    }
}
