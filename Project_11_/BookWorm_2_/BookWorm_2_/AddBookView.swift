//
//  AddBookView.swift
//  BookWorm_2_
//
//  Created by kanishk vijaywargiya on 21/03/21.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genere = ""
    @State private var review = ""
    
    let generes = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Authors name", text: $author)
                    
                    Picker("Genere", selection: $genere) {
                        ForEach(generes, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    RatingView(rating: $rating, label: "Rating")
                    TextField("Write a review", text: $review)
                }
                
                Section{
                    Button("Save"){
                        if(self.title != "" && self.author != "" && self.genere != ""){
                            let newBook = Book(context: self.moc)
                            newBook.id = UUID()
                            newBook.title = self.title
                            newBook.author = self.author
                            newBook.genere = self.genere
                            newBook.rating = Int16(self.rating)
                            newBook.review = self.review
                            
                            try? self.moc.save()
                            
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
            .navigationBarTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
