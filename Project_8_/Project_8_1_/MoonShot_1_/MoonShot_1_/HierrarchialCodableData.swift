//
//  HierrarchialCodableData.swift
//  MoonShot_1_
//
//  Created by kanishk vijaywargiya on 13/03/21.
//

import SwiftUI

struct HierrarchialCodableData: View {
    var body: some View {
        Button("Decode JSON"){
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555 taylor swift avenue",
                    "city": "Nashville"
                }
            }
            """
            
            struct User: Codable {
                var name: String
                var address: Address
            }
            struct Address: Codable {
                var street: String
                var city: String
            }
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data){
                print(user.name)
                print(user.address.street)
                print(user.address.city)
            }
        }
    }
}

struct HierrarchialCodableData_Previews: PreviewProvider {
    static var previews: some View {
        HierrarchialCodableData()
    }
}
