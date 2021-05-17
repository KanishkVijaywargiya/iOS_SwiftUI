//
//  UserDefaultStoreData.swift
//  Project_7
//
//  Created by kanishk vijaywargiya on 07/03/21.
//

import SwiftUI

struct UserDefaultStoreData: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Count")
    
    var body: some View {
        Button("Tap Count \(tapCount)") {
            self.tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "Count")
        }
    }
}

struct UserDefaultStoreData_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultStoreData()
    }
}
