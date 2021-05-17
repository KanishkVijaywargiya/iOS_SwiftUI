//
//  ContentView.swift
//  path_1_
//
//  Created by kanishk vijaywargiya on 15/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            //path.addLine(to: CGPoint(x: 100, y: 300))
        }
        .stroke(Color.green.opacity(0.25), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        //.stroke(Color.blue.opacity(0.25), lineWidth: 10)
        //.fill(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
