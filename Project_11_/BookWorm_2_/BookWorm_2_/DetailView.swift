//
//  DetailView.swift
//  BookWorm_2_
//
//  Created by kanishk vijaywargiya on 21/03/21.
//

import SwiftUI
import CoreData

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var body: some View {
        GeometryReader{ geo in
            VStack{
                ZStack(alignment: .bottomTrailing){
                    Image(self.book.genere ?? "Fantasy")
                        .frame(maxWidth: geo.size.width)
                    
                    Text(self.book.genere?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }
                Text(self.book.author ?? "Unknown author")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Text(self.book.review ?? "No reviews")
                    .padding()
                
                RatingView(rating: .constant(Int(self.book.rating)), label: "Rating:")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
            }
        }
        .navigationBarTitle(Text(book.title ?? "Unknown book"),displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showingDeleteAlert = true
        }){
            Image(systemName: "trash")
        })
        .alert(isPresented: $showingDeleteAlert){
            Alert(title: Text("Delete book"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete")){
                self.deleteBook()
            }, secondaryButton: .cancel())
        }
    }
    
    func deleteBook() {
        moc.delete(book)
        try? self.moc.save()
        presentationMode.wrappedValue.dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test book"
        book.author = "Test author"
        book.genere = "Fantasy"
        book.rating = 4
        book.review = "This was a great book; I really enjoyed it"
        
        return NavigationView{
            DetailView(book: book)
        }
    }
}
