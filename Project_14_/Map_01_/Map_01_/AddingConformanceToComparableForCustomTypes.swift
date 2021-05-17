//
//  AddingConformanceToComparableForCustomTypes.swift
//  Map_01_
//
//  Created by kanishk vijaywargiya on 02/04/21.
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct AddingConformanceToComparableForCustomTypes: View {
    //let values = [1,3,6,4,2,9,0,8,5,7].sorted()
    
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister")
    ].sorted()
//    .sorted {
//        $0.lastName < $1.lastName
//    }
    
    var body: some View {
        List(users) {user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

struct AddingConformanceToComparableForCustomTypes_Previews: PreviewProvider {
    static var previews: some View {
        AddingConformanceToComparableForCustomTypes()
    }
}
