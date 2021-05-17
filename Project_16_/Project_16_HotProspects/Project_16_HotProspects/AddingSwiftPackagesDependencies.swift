//
//  AddingSwiftPackagesDependencies.swift
//  Project_16_HotProspects
//
//  Created by kanishk vijaywargiya on 11/04/21.
//

import SamplePackage
import SwiftUI

struct AddingSwiftPackagesDependencies: View {
    let possibleNumber = Array(1...60)
    
    var results: String {
        let selected = possibleNumber.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
    
    var body: some View {
        Text(results)
    }
}

struct AddingSwiftPackagesDependencies_Previews: PreviewProvider {
    static var previews: some View {
        AddingSwiftPackagesDependencies()
    }
}
