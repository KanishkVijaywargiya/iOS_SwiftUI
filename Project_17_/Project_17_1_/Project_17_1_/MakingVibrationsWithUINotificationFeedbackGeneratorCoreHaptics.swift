//
//  MakingVibrationsWithUINotificationFeedbackGeneratorCoreHaptics.swift
//  Project_17_1_
//
//  Created by kanishk vijaywargiya on 13/04/21.
//

import CoreHaptics
import SwiftUI

struct MakingVibrationsWithUINotificationFeedbackGeneratorCoreHaptics: View {
    @State private var engine: CHHapticEngine?
    
    var body: some View {
        Text("Hello, World!")
            //.onTapGesture(perform: simpleSuccess)
            .onAppear(perform: prepareHaptics)
            .onTapGesture(perform: complexSuccess)
    }
    // vibrations
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        //generator.notificationOccurred(.error)
        //generator.notificationOccurred(.warning)
    }
    // heptics
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        do {
            self.engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            events.append(event)
        }
        
        // create one intense, sharp tap
        // let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        // let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        // let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        // events.append(event)
        
        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
}

struct MakingVibrationsWithUINotificationFeedbackGeneratorCoreHaptics_Previews: PreviewProvider {
    static var previews: some View {
        MakingVibrationsWithUINotificationFeedbackGeneratorCoreHaptics()
    }
}
