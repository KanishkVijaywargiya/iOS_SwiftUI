//
//  Validating&DisablingForm.swift
//  Cupcake_1_
//
//  Created by kanishk vijaywargiya on 17/03/21.
//

import SwiftUI

struct Validating_DisablingForm: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm:Bool{
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form{
            Section{
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            Section{
                Button("Create account"){
                    print("Account created!")
                }
            }
            //.disabled(username.isEmpty || email.isEmpty)
            .disabled(disableForm)
        }
    }
}

struct Validating_DisablingForm_Previews: PreviewProvider {
    static var previews: some View {
        Validating_DisablingForm()
    }
}
