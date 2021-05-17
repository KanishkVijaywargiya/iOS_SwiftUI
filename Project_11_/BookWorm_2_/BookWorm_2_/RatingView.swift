//
//  RatingView.swift
//  BookWorm_2_
//
//  Created by kanishk vijaywargiya on 21/03/21.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maxRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            Spacer()
            ForEach(1..<maxRating + 1){num in
                self.image(for: num)
                    .foregroundColor(num > self.rating ? self.offColor : self.onColor)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    .onTapGesture {
                        withAnimation(.spring()){
                            self.rating = num
                        }
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        }else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
