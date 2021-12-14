//
//  RCSPlaceAnnotation.swift
//  Lunch
//
//  Created by Ryan Spring on 12/5/21.
//

import MapKit
import SwiftUI

final class RCSAnnotation<Annotation: RCSAnnotating>: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D { annotation.thing }
    var title: String? { "" }
    
    let annotation: Annotation
    let view: Annotation.ViewType

    init(annotation: Annotation) {
        self.annotation = annotation
        self.view = annotation.view
        super.init()
    }
}
