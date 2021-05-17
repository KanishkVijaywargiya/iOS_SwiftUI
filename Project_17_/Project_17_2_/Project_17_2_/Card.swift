//
//  singleCardView.swift
//  Project_17_2_
//
//  Created by kanishk vijaywargiya on 14/04/21.
//

import Foundation

struct Card: Codable {
    let prompt: String
    let answer: String
    
    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
