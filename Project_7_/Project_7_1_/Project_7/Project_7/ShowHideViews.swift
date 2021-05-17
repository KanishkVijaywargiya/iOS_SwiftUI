//
//  ShowHideViews.swift
//  Project_7
//
//  Created by kanishk vijaywargiya on 07/03/21.
//

import SwiftUI

struct SecondView: View {
    //TODO: Step1: to dismiss the sheet use @Environment
    @Environment(\.presentationMode) var presentationMode
    
    var name: String
    let dg = DragGesture()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .highPriorityGesture(dg)
            
            VStack {
                Text("Hello \(name)")
                
                Button("Dismiss"){
                    // TODO: Step2: dismiss a sheet
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct ShowHideViews: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Kanishk")
        }
    }
}

struct ShowHideViews_Previews: PreviewProvider {
    static var previews: some View {
        ShowHideViews()
    }
}
