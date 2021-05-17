//
//  ContentView.swift
//  WeSplit_2
//
//  Created by kanishk vijaywargiya on 22/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalperPerson: Double {
        // calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmount: Double{
        let orderAmount = Double(checkAmount) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
        Form {
            Section {
                TextField("Please enter the amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
                
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2 ..< 100) {
                        Text("\($0) people")
                    }
                }
            }
            Section(header: Text("How much tip do you want to leave?")) {
                Picker("Tip Percentage", selection: $tipPercentage) {
                    ForEach(0 ..< tipPercentages.count ) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Total amt. (incl. Tip)")) {
                Text("₹ \(totalAmount, specifier: "%.2f")")
            }
            Section(header: Text("Amount per person")) {
                Text("₹ \(totalperPerson, specifier: "%.2f")")
            }
        }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
