//
//  AddressVIew.swift
//  Cupcake_2_
//
//  Created by kanishk vijaywargiya on 17/03/21.
//

import SwiftUI

struct AddressVIew: View {
    @ObservedObject var order: Order
    
    @State private var hasTitle = true
    
    var body: some View {
        Form{
            Section{
                TextField("Name", text: $order.name)
                TextField("Street address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            Section{
                NavigationLink(
                    destination: CheckOutView(order: order)
                        .onAppear {
                            self.hasTitle = false
                        }
                        .onDisappear {
                            self.hasTitle = true
                        }
                ){
                    Text("Check out")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationBarTitle(self.hasTitle ?"Delivery details":"",displayMode: .inline)
    }
}

struct AddressVIew_Previews: PreviewProvider {
    static var previews: some View {
        AddressVIew(order: Order())
    }
}
