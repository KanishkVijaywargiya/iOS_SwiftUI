//
//  ContentView.swift
//  Project_4
//
//  Created by kanishk vijaywargiya on 04/03/21.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    
    var body: some View {
        
        let now = Date()
        let tomorrow = Date().addingTimeInterval(86400)
        let range = now...tomorrow
        
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? Date()
        
//        let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        
        return VStack {
            Form {
                Text(dateString)
                DatePicker("Please enter a date", selection: $wakeUp, in: range)
                
                DatePicker("Please enter a date", selection: $wakeUp, in: ...Date())
                    .labelsHidden()
                
                DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)
                    .labelsHidden()
                
                DatePicker("Please enter a date", selection: $wakeUp)
                
                DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .date)
                    .labelsHidden()
                
                DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
            }
            Section {
                DatePicker("Please enter a date", selection: $wakeUp)
                Stepper(value: $sleepAmount, in: 4...12, step: 2.5){
                    Text("\(sleepAmount, specifier: "%g") hours")
                }
                Stepper(value: $sleepAmount, in: 4...12, step: 2.5){
                    Text("\(sleepAmount, specifier: "%.2f") hours")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
