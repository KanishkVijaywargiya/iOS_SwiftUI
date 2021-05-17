//
//  TouchIDandFaceID.swift
//  Map_01_
//
//  Created by kanishk vijaywargiya on 02/04/21.
//

import LocalAuthentication
import SwiftUI

// add info.plist for touchID &
struct TouchIDandFaceID: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if self.isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authentication)
    }
    
    func authentication() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "We need to unlock your data."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        
                    }
                }
            }
        } else {
            // other than bio metric authentications
        }
    }
}

struct TouchIDandFaceID_Previews: PreviewProvider {
    static var previews: some View {
        TouchIDandFaceID()
    }
}
