//
//  ContentView.swift
//  Project_4_2
//
//  Created by kanishk vijaywargiya on 04/03/21.
//

import SwiftUI

struct ContentView: View {
    
    static var defaultWakeUpTime: Date{
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    @State private var wakeUp = defaultWakeUpTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAMount = 1
    
    @State private var alertTitle = ""
    @State private var alertMsg = ""
    @State private var showingAlert = false
    
    @State private var output = "Your ideal bed time is..."
    
    private var dateProxy: Binding<Date> {
        Binding<Date>(get: {self.wakeUp}, set: {
            self.wakeUp = $0
            self.calculateBedTime()
        })
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    VStack(alignment: .leading, spacing: 0.0) {
                        Text("When do you want to wake up ???").font(.headline)
                        //                        DatePicker("Please enter the time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        //                            .labelsHidden()
                        //                            .datePickerStyle(WheelDatePickerStyle())
                        DatePicker("Please enter the time", selection: dateProxy, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .datePickerStyle(WheelDatePickerStyle())
                    }
                    
                    Section{
                        VStack(alignment: .leading, spacing: 0.0) {
                            Text("Desired amount of sleep").font(.headline)
                            //                            Stepper(value: $sleepAmount, in: 4...12, step: 0.25){
                            //                                Text("\(sleepAmount, specifier: "%g") hours")
                            //                            }
                            Stepper(onIncrement: {
                                self.sleepAmount += 1
                                self.calculateBedTime()
                            }, onDecrement: {
                                if sleepAmount < 1 {
                                    print("Hello")
                                }else{
                                    self.sleepAmount -= 1
                                    self.calculateBedTime()
                                }
                            }) {
                                Text("\(sleepAmount, specifier: "%g") hours")
                            }
                        }
                    }
                    
                    Section{
                        VStack(alignment: .leading, spacing: 0.0) {
                            Text("Daily coffee intake").font(.headline)
                            //                            Stepper(value: $coffeeAMount, in: 1...20){
                            //                                if coffeeAMount == 1 {
                            //                                    Text("1 cup")
                            //                                }else{
                            //                                    Text("\(coffeeAMount) cups")
                            //                                }
                            //                            }
                            Stepper(onIncrement: {
                                self.coffeeAMount += 1
                                self.calculateBedTime()
                            }, onDecrement: {
                                if coffeeAMount < 1 {
                                    print("Hello")
                                }else{
                                    self.coffeeAMount -= 1
                                    self.calculateBedTime()
                                }
                            }) {
                                if coffeeAMount == 1 {
                                    Text("\(coffeeAMount) cup")
                                }else{
                                    Text("\(coffeeAMount) cups")
                                }
                            }
                        }
                    }
                    Section {
                        VStack(alignment: .leading, spacing: 0.0) {
                            Text(output).font(.headline)
                        }
                    }
                }
            }
            .navigationBarTitle("Better Rest")
            .navigationBarItems(trailing:
                                    //                                    Button("Hello"){
                                    //                                        print("Button was tapped")
                                    //                                    }
                                    Button(action: {
                                        self.calculateBedTime()
                                    }) {
                                        Text("Calculate")
                                    }
            )
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMsg), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func calculateBedTime() {
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAMount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            alertMsg = formatter.string(from: sleepTime)
            alertTitle = "Your ideal bed time is..."
            
            output = "Your ideal bed time is \(formatter.string(from: sleepTime))"
        } catch {
            alertMsg = "Sorry for inconvinience"
            alertTitle = "Error..."
            
            output = "Sorry for inconvinience"
        }
        //        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
