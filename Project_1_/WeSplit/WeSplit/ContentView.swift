//
//  ContentView.swift
//  WeSplit
//
//  Created by kanishk vijaywargiya on 22/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your student", selection: $selectedStudent){
                        ForEach(0 ..< students.count) {
                            Text(self.students[$0])
                        }
                    }
                }
                Section {
                    ForEach(0 ..< 10) {
                        Text("Row \($0)")
                    }
                }
                Section {
                    ForEach(0 ..< 100) { number in
                        Text("Row \(number)")
                    }
                }
                Section {
                    // 2 way binding
                    TextField("Enter your name", text: $name)
                    // reading the value
                    Text("My name is \(name)")
                }
                Section {
                    Button("Tap Count \(tapCount)"){
                        self.tapCount += 1
                    }
                }
                Group {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
            }
            .navigationBarTitle(Text("WeSplit"),displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
