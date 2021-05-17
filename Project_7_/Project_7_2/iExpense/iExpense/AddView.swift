//
//  AddView.swift
//  iExpense
//
//  Created by kanishk vijaywargiya on 07/03/21.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type){
                    ForEach(Self.types, id: \.self){
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("\(alertTitle)"), message: Text("\(alertMessage)"), dismissButton: .default(Text("OK")))
            }
            
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Upload"){
                if let actualAmount = Int(self.amount) {
                    if !self.name.isEmpty {
                        let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                        self.expenses.items.append(item)
                        self.presentationMode.wrappedValue.dismiss()
                    }else{
                        self.showingAlert = true
                        alertTitle = "Alert"
                        alertMessage = "Please enter name..."
                    }
                } else {
                    self.showingAlert = true
                    alertTitle = "Alert"
                    alertMessage = "Please enter proper amount...!"
                }
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
