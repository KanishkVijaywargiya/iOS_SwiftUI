//
//  BookWorm.swift
//  BookWorm_2_
//
//  Created by kanishk vijaywargiya on 21/03/21.
//

import SwiftUI

struct BookWorm: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Book.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.title, ascending: true),
        NSSortDescriptor(keyPath: \Book.author, ascending: false)
    ])
    var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView{
            List {
                ForEach(books, id: \.self) {book in
                    NavigationLink(destination: DetailView(book: book)){
                        EmojiRatingView(rating: book.rating)
                        VStack(alignment: .leading){
                            Text(book.title ?? "Unknown title")
                                .font(.headline)
                                .foregroundColor(book.rating < 2 ? .red : .black)
                            
                            Text(book.author ?? "Unknown author")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationBarTitle("Bookworm")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showingAddScreen.toggle()
            }){
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddScreen){
                AddBookView().environment(\.managedObjectContext, self.moc)
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet){
        for offset in offsets {
            // find this book in fetch request
            let book = books[offset]
            
            //delete it from the context
            moc.delete(book)
        }
        
        //save the context
        try? moc.save()
    }
}

struct BookWorm_Previews: PreviewProvider {
    static var previews: some View {
        BookWorm()
    }
}
