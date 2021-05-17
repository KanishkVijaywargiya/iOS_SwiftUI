//
//  CodableConformancePublishedProperties.swift
//  Cupcake_1_
//
//  Created by kanishk vijaywargiya on 17/03/21.
//

import SwiftUI

class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Kanishk Vijaywargiya"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder)throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct CodableConformancePublishedProperties: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CodableConformancePublishedProperties_Previews: PreviewProvider {
    static var previews: some View {
        CodableConformancePublishedProperties()
    }
}
