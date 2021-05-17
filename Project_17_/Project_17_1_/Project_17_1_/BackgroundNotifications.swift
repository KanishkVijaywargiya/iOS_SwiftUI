//
//  BackgroundNotifications.swift
//  Project_17_1_
//
//  Created by kanishk vijaywargiya on 13/04/21.
//

import SwiftUI


struct BackgroundNotifications: View {
    var body: some View {
        VStack{
            Text("Background!")
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                    print("Moving to the background!")
                }
            Text("Foreground!")
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                    print("Moving back to the foreground!")
                }
            Text("Screenshot!")
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in
                    print("User took a screenshot!")
                }
        }
    }
}

struct BackgroundNotifications_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundNotifications()
    }
}
