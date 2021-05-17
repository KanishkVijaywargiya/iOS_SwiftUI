//
//  SchedulingLocalNotifications .swift
//  Project_16_HotProspects
//
//  Created by kanishk vijaywargiya on 11/04/21.
//

import UserNotifications
import SwiftUI

struct SchedulingLocalNotifications: View {
    var body: some View {
        VStack {
            Button("Request Permission"){
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){ success, error in
                    if success {
                        print("All set...!")
                    }else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.black)
            
            Button("Schedule Notifications"){
                let content = UNMutableNotificationContent()
                content.title = "Feed the doggy!"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default
                
                // show the notification 5 sec from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            
        }
    }
}

struct SchedulingLocalNotifications_Previews: PreviewProvider {
    static var previews: some View {
        SchedulingLocalNotifications()
    }
}
