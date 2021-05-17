//
//  CupCake.swift
//  Cupcake_2_
//
//  Created by kanishk vijaywargiya on 17/03/21.
//

import SwiftUI

struct CupCake: View {
    @State private var hasTitle = true
    
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Please select your cake type", selection: $order.type) {
                        ForEach(0..<Order.types.count){
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.quantity, in: 1...20){
                        Text("Number of cakes: \(order.quantity)")
                    }
                }
                Section{
                    Toggle(isOn: $order.specialRequestEnabled.animation()){
                        Text("Any special requests")
                    }
                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extraFrosting){
                            Text("Any extra frosting")
                        }
                        Toggle(isOn: $order.addSprinkles){
                            Text("Any extra sprinkles")
                        }
                    }
                }
                Section{
                    NavigationLink(
                        destination: AddressVIew(order: order)
                            .onAppear {
                                self.hasTitle = false
                            }
                            .onDisappear {
                                self.hasTitle = true
                            }
                    ){
                        Text("Delivery details")
                    }
                }
            }
            .navigationBarTitle(self.hasTitle ?"Cupcake Corner":"")
        }
    }
}

struct CupCake_Previews: PreviewProvider {
    static var previews: some View {
        CupCake()
    }
}
