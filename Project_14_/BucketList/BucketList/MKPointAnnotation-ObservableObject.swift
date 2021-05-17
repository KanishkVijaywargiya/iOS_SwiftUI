//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by kanishk vijaywargiya on 02/04/21.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        set {
            title = newValue
        }
    }
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }
        set {
            subtitle = newValue
        }
    }
}
