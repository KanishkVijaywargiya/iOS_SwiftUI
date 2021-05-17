//
//  StateWithObservedObject.swift
//  Project_7
//
//  Created by kanishk vijaywargiya on 07/03/21.
//

import SwiftUI

// TODO: step1: This class confirms to protocols --- ObservableObject
class User1: ObservableObject {
 // TODO: Step2: write @Published before properties
    @Published var firstName = "Kanishk"
    @Published var lastName = "Vijaywargiya"
}

struct StateWithObservedObject: View {
    // TODO: Step3: write @ObservedObject instead of @State
    @ObservedObject private var user = User1()
    
    var body: some View {
        VStack {
            Text("Your name is: \(user.firstName) \(user.lastName)")
            
            TextField("First name: ", text: $user.firstName)
            TextField("Last name: ", text: $user.lastName)
        }
    }
}

struct StateWithObservedObject_Previews: PreviewProvider {
    static var previews: some View {
        StateWithObservedObject()
    }
}
