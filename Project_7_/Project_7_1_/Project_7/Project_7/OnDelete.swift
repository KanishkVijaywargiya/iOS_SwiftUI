//
//  OnDelete.swift
//  Project_7
//
//  Created by kanishk vijaywargiya on 07/03/21.
//

import SwiftUI

struct OnDelete: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self){
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                    .onMove { (source: IndexSet, destination: Int) in
                        numbers.move(fromOffsets: source, toOffset: destination)
                    }
                }
                
                Button("Add Number"){
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }
            .navigationBarItems(leading: EditButton())
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct OnDelete_Previews: PreviewProvider {
    static var previews: some View {
        OnDelete()
    }
}
