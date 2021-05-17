//
//  StateOnlyWorksWithStruct.swift
//  Project_7
//
//  Created by kanishk vijaywargiya on 07/03/21.
//

import SwiftUI

struct User {
    var firstName = "Kanishk"
    var lastName = "Vijaywargiya"
}

//class User {
//    var firstName = "Kanishk"
//    var lastName = "Vijaywargiya"
//}

struct StateOnlyWorksWithStruct: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is: \(user.firstName) \(user.lastName)")
            
            TextField("First name: ", text: $user.firstName)
            TextField("Last name: ", text: $user.lastName)
        }
    }
}

struct StateOnlyWorksWithStruct_Previews: PreviewProvider {
    static var previews: some View {
        StateOnlyWorksWithStruct()
    }
}
