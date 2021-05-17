//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by kanishk vijaywargiya on 23/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ScrollView(.vertical, showsIndicators: false) {
                Section {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [.orange, .white]), startPoint: .top, endPoint: .bottom)
                            .frame(width: 415, height: 200)
                    }
                    ZStack {
                        Button("Show Alert") {
                            self.showingAlert = true
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
                        }
                    }
                    .padding(20)
                    ZStack {
                        Button(action: {
                            print("Button was tapped!")
                        }){
                            HStack(spacing: 10) {
                                Image(systemName: "pencil")
                                Text("Tap on me!")
                            }
                        }
                    }
                    ZStack {
                        RadialGradient(gradient: Gradient(colors: [.white, .green]), center: .center, startRadius: 20, endRadius: 200)
                            .frame(width: 415, height: 200)
                    }
                    ZStack {
                        Button("Tap me!") {
                            print("Button was tapped!")
                        }
                    }
                    ZStack {
                        AngularGradient(gradient: Gradient(colors:[.purple, .blue, .green, .yellow, .orange, .red]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .frame(width: 415, height: 500)
                    }
                }
                
                Section {
                    ZStack {
                        Color.red.frame(width: 200, height: 200)
                        Color(red: 1, green: 0, blue: 0)
                        Text("Hello, red!")
                    }
                    ZStack {
                        Color.red.frame(width: 200, height: 200)
                        Color(red: 0, green: 1, blue: 0)
                        Text("Hello, green!")
                    }
                    ZStack {
                        Color.blue.frame(width: 415, height: 230)
                        Text("Hello, blue!")
                    }
                }
                
                Section {
                    Text("Hello, world!")
                    Text("This is another text view!")
                    Spacer()
                    
                    VStack(spacing: 5) {
                        Text("Hello, world!!!")
                        Text("This is another text view!")
                    }
                    Spacer()
                    
                    HStack(spacing: 20) {
                        Text("Hello, world!!!")
                        Text("This is another text view!")
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
