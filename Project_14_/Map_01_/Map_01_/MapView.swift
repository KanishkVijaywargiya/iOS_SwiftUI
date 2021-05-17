//
//  MapView.swift
//  Map_01_
//
//  Created by kanishk vijaywargiya on 02/04/21.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    //Communicating With a MapKit Coordinator
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        
        // customize the marker looks
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            view.canShowCallout = true
            return view
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let annotation = MKPointAnnotation()
        annotation.title = "Parwanoo"
        annotation.subtitle = "Home"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 30.8524, longitude: 76.9521)
        mapView.addAnnotation(annotation)
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
