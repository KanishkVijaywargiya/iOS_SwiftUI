//
//  ContentView.swift
//  iExpense
//
//  Created by kanishk vijaywargiya on 07/03/21.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem](){
        didSet{
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(items){
                UserDefaults.standard.set(data, forKey: "Items")
            }
        }
    }
    
    init(){
        if let items = UserDefaults.standard.data(forKey: "Items"){
            let decoder = JSONDecoder()
            if let data = try? decoder.decode([ExpenseItem].self, from: items){
                self.items = data
                return
            }
        }
        self.items = []
    }
}

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    
    @State private var addExpense = false
    
    var body: some View {
        
        VStack {
            NavigationView {
                List {
                    ForEach(expenses.items) { item in
                        HStack {
                            Image(systemName: "triangle")
                            
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                                    .font(.caption)
                            }
                            Spacer()
                            Text("₹\(item.amount)")
                        }
                    }
                    .onDelete(perform: removeRows)
                    .onMove { (source: IndexSet, destination: Int) in
                        expenses.items.move(fromOffsets: source, toOffset: destination)
                    }
                }
                .navigationBarTitle("iExpense")
                .navigationBarItems(leading: EditButton(), trailing:
                                        Button(action:{
                                            self.addExpense.toggle()
                                        }){
                                            Image(systemName: "plus")
                                        }
                )
            }
            .sheet(isPresented: $addExpense) {
                AddView(expenses: self.expenses)
            }
            
            VStack(spacing: 20){
                Text("Made in India")
                    .foregroundColor(.blue)
                    .font(.caption)
                    .fontWeight(.bold)
            }
        }
    }
    func removeRows(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
