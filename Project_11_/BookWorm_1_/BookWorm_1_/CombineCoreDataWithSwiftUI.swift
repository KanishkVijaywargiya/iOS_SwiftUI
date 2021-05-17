//
//  CombineCoreDataWithSwiftUI.swift
//  BookWorm_1_
//
//  Created by kanishk vijaywargiya on 20/03/21.
//

import SwiftUI

struct CombineCoreDataWithSwiftUI: View {
    // Managed Object Context (MOC)
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Student.entity(), sortDescriptors: [])
    var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List {
                ForEach(students, id: \.id) { student in
                    Text(student.name ?? "Annonymous")
                }
            }
            Button("Add"){
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                
                let choosenFirstName = firstNames.randomElement()!
                let choosenLastName = lastNames.randomElement()!
                
                let student = Student(context: self.moc)
                student.id = UUID()
                student.name = "\(choosenFirstName) \(choosenLastName)"
                
                try? self.moc.save()
            }
        }
    }
}

struct CombineCoreDataWithSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        CombineCoreDataWithSwiftUI()
    }
}
