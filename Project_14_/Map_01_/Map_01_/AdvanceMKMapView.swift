//
//  AdvanceMKMapView.swift
//  Map_01_
//
//  Created by kanishk vijaywargiya on 02/04/21.
//

import MapKit
import SwiftUI

struct AdvanceMKMapView: UIViewRepresentable {
    
    @Binding var centerCoordinate: CLLocationCoordinate2D
    var annotations: [MKPointAnnotation]
    
    //Communicating With a MapKit Coordinator
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: AdvanceMKMapView
        
        init(_ parent: AdvanceMKMapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        print("Updating")
        if annotations.count != view.annotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(annotations)
        }
    }
}

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "Parwanoo"
        annotation.subtitle = "Home"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 30.8524, longitude: 76.9521)
        
        return annotation
    }
}

struct AdvanceMKMapView_Previews: PreviewProvider {
    static var previews: some View {
        AdvanceMKMapView(centerCoordinate:
                            .constant(MKPointAnnotation.example.coordinate),
                         annotations: [MKPointAnnotation.example]
        )
    }
}
