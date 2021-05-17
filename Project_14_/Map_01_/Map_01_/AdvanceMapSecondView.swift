//
//  AdvanceMapSecondView.swift
//  Map_01_
//
//  Created by kanishk vijaywargiya on 02/04/21.
//

import MapKit
import SwiftUI

struct AdvanceMapSecondView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation]()
    
    var body: some View {
        ZStack {
            AdvanceMKMapView(centerCoordinate: $centerCoordinate, annotations: locations)
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        let newLocation = MKPointAnnotation()
                        newLocation.coordinate = self.centerCoordinate
                        self.locations.append(newLocation)
                    }) {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
    }
}

struct AdvanceMapSecondView_Previews: PreviewProvider {
    static var previews: some View {
        AdvanceMapSecondView()
    }
}
