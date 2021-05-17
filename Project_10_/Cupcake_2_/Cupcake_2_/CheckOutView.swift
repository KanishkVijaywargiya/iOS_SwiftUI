//
//  CheckOutView.swift
//  Cupcake_2_
//
//  Created by kanishk vijaywargiya on 17/03/21.
//

import SwiftUI

struct CheckOutView: View {
    @ObservedObject var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        GeometryReader {geo in
            ScrollView{
                VStack{
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("Your total is $\(self.order.cost,specifier: "%.2f")")
                        .font(.title)
                    
                    Button("Place order"){
                        self.placeOrder()
                    }
                    .padding()
                }
            }
        }
        .alert(isPresented: $showingConfirmation) {
            Alert(title: Text("Thank you!"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        }
        .navigationBarTitle("Check out",displayMode: .inline)
    }
    
    func placeOrder(){
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order!")
            return
        }
        
        //TODO: POST Method
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data = data else{
                print("No data in response: \(error?.localizedDescription ?? "Unknown Error").")
                return
            }
            
            if let decodeOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "Your order for \(decodeOrder.quantity)x \(Order.types[decodeOrder.type].lowercased()) cupcakes is on its way!!!"
                self.showingConfirmation = true
            }else{
                print("Invalid response from server!")
            }
            
        }.resume()
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(order: Order())
    }
}
