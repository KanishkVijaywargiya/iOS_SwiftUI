//
//  ContentView.swift
//  WordScramble
//
//  Created by kanishk vijaywargiya on 05/03/21.
//

import SwiftUI

struct ContentView: View {
    
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        let input = "a b c"
        let letters = input.components(separatedBy: "")
        
        return Text("Hello World!")
        
//        if let fileUrl = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
//            if let fileContents = try? String(contentsOf: fileUrl){
//
//            }
//        }
        
//        return List{
//            ForEach(people, id: \.self) {
//                Text($0)
//            }
//        }
//        .listStyle(GroupedListStyle())
        //        List(people, id: \.self) {
        //            Text($0)
        //        }
        //         .listStyle(GroupedListStyle())
        
        
        //        List(0..<5) {
        //            Text("Dynamic Row \($0)")
        //        }
        //        .listStyle(GroupedListStyle())
        //        List {
        //            Section(header: Text("Static Section 1")){
        //                Text("Static row 1")
        //                Text("Static row 2")
        //            }
        //
        //            Section(header: Text("Dynamic Section 1")){
        //                ForEach(0..<5){
        //                    Text("Dynamic row \($0)")
        //                }
        //            }
        //
        //            Section(header: Text("Static Section 2")){
        //                Text("Static row 3")
        //                Text("Static row 4")
        //            }
        //        }
        //        .listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
