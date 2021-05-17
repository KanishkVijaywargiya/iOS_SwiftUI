//
//  ManuallyPublishingObservableObjectChanges .swift
//  Project_16_HotProspects
//
//  Created by kanishk vijaywargiya on 11/04/21.
//

import SwiftUI

class DelayedUpdater: ObservableObject {
    // @Published var value = 0
    
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ManuallyPublishingObservableObjectChanges: View {
    @ObservedObject var updater = DelayedUpdater()
    
    var body: some View {
        Text("Value is: \(updater.value)")
    }
}

struct ManuallyPublishingObservableObjectChanges_Previews: PreviewProvider {
    static var previews: some View {
        ManuallyPublishingObservableObjectChanges()
    }
}
