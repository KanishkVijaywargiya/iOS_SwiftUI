//
//  WritingDataToTheDocumentsDirectory.swift
//  Map_01_
//
//  Created by kanishk vijaywargiya on 02/04/21.
//

import SwiftUI

struct WritingDataToTheDocumentsDirectory: View {
    func getDocumentDirectory() -> URL {
        // find all possible documents directories for this user
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //just send back the first one, which ought to be the only one
        return path[0]
    }
    
    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                let str = "Text message"
                let url = self.getDocumentDirectory().appendingPathComponent("message.txt")
                
                do{
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
}

struct WritingDataToTheDocumentsDirectory_Previews: PreviewProvider {
    static var previews: some View {
        WritingDataToTheDocumentsDirectory()
    }
}
