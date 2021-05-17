//
//  TriggerEveentsWithTimmer.swift
//  Project_17_1_
//
//  Created by kanishk vijaywargiya on 13/04/21.
//

import SwiftUI

struct TriggerEveentsWithTimmer: View {
    // let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()

    @State private var counter = 0
    
    var body: some View {
        Text("Hello, World!")
            .onReceive(timer) { time in
                if self.counter == 5 {
                    self.timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                
                self.counter += 1
            }
        // Text("Timer!")
        // .onReceive(timer) { time in
        //   print("The time is now \(time)")
        // }
    }
}

struct TriggerEveentsWithTimmer_Previews: PreviewProvider {
    static var previews: some View {
        TriggerEveentsWithTimmer()
    }
}
