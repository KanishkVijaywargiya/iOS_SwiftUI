//
//  CreatingContextMenus.swift
//  Project_16_HotProspects
//
//  Created by kanishk vijaywargiya on 11/04/21.
//

import SwiftUI

struct CreatingContextMenus: View {
    @State private var backgroundColor = Color.red
    @State private var num = 0
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(backgroundColor)
            
            Text("Change Color")
                .padding()
                .contextMenu(ContextMenu(menuItems: {
                    Button(action: {
                        self.backgroundColor = .red
                        self.num = 0
                    }){
                        Text("Red")
                        if num == 0 {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.red)
                        }
                    }
                    Button(action: {
                        self.backgroundColor = .green
                        self.num = 1
                    }){
                        Text("Green")
                        if num == 1 {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                    }
                    Button(action: {
                        self.backgroundColor = .blue
                        self.num = 2
                    }){
                        Text("Blue")
                        if num == 2 {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)
                        }
                    }
                }))
        }
    }
}

struct CreatingContextMenus_Previews: PreviewProvider {
    static var previews: some View {
        CreatingContextMenus()
    }
}
