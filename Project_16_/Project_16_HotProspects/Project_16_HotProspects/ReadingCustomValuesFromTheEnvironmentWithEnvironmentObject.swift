//
//  ReadingCustomValuesFromTheEnvironmentWithEnvironmentObject.swift
//  Project_16_HotProspects
//
//  Created by kanishk vijaywargiya on 09/04/21.
//

import SwiftUI

// class with published property and observable object
class User: ObservableObject {
    @Published var name = "Yo Yo Honey Singh"
}

// first view
struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View{
        TextField("Name", text: $user.name)
    }
}

// second view
struct DisplayView: View{
    @EnvironmentObject var user: User
    
    var body: some View{
        Text(user.name)
    }
}

struct ReadingCustomValuesFromTheEnvironmentWithEnvironmentObject: View {
    let user = User()
    var body: some View {
        VStack{
            EditView()
            DisplayView()
        }
        .environmentObject(user)
    }
}

struct ReadingCustomValuesFromTheEnvironmentWithEnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        ReadingCustomValuesFromTheEnvironmentWithEnvironmentObject()
    }
}
