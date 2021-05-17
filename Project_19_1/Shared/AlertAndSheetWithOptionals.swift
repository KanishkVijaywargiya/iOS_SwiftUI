//
//  AlertAndSheetWithOptionals.swift
//  Project_19_1
//
//  Created by KANISHK VIJAYWARGIYA on 19/04/21.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct AlertAndSheetWithOptionals: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingALert = false
    
    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                self.selectedUser = User()
                self.isShowingALert = true
            }
            .alert(isPresented: $isShowingALert) {
                Alert(title: Text(selectedUser!.id))
            }
    }
}

struct AlertAndSheetWithOptionals_Previews: PreviewProvider {
    static var previews: some View {
        AlertAndSheetWithOptionals()
    }
}
