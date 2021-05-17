//
//  ScrollViewWithScrollingData.swift
//  MoonShot_1_
//
//  Created by kanishk vijaywargiya on 13/03/21.
//

import SwiftUI

struct CustomText: View{
    var text: String
    var body: some View{
        Text(text)
    }
    init(_ text:String){
        print("Creating a custom text")
        self.text = text
    }
}

struct ScrollViewWithScrollingData: View {
    var body: some View {
        
        //        TODO: - scroll view lets the data to load at once.
        //        ScrollView(.vertical, showsIndicators:false) {
        //            VStack(spacing: 20.0) {
        //                ForEach(0..<100) {
        //                    CustomText("Item \($0)")
        //                        .font(.title)
        //                }
        //            }
        //            .frame(maxWidth: .infinity)
        //        }
        
        //TODO: - list lets the data load what is visible on screen (limits the data)
        //        List{
        //            ForEach(0..<100) {
        //                CustomText("Item \($0)")
        //                    .font(.title)
        //            }
        //        }
        //        .frame(maxWidth: .infinity)
        
        //TODO: - another excellent way that will load data as per the list.
        ScrollView(.vertical, showsIndicators:false) {
            LazyVStack(spacing: 20.0) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ScrollViewWithScrollingData_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewWithScrollingData()
    }
}
