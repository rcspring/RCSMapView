//
//  RCSAccessoryMapView.swift
//  Lunch
//
//  Created by Ryan Spring on 12/5/21.
//

import Foundation
import MapKit
import SwiftUI



public struct RCSAccessoryMapView<Annotation: RCSAnnotating>: UIViewRepresentable {
    var mapRect: Binding<MKCoordinateRegion>
    let annotations: [Annotation]
    
    public init(mapRect: Binding<MKCoordinateRegion>, annotations: [Annotation]) {
        self.mapRect = mapRect
        self.annotations = annotations
    }
    
    public func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        mapView.register(RCSAnnotationView<Annotation>.self,
                         forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        return mapView
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(mapRect,
                           annotations: annotations)
    }
    
    public func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.region = context.coordinator.mapRect.wrappedValue
        uiView.addAnnotations(annotations.map {
            return RCSAnnotation(annotation: $0)
        })
    }
    
    public final class Coordinator: NSObject, MKMapViewDelegate {
        var mapRect: Binding<MKCoordinateRegion>

        init(_ mapRect: Binding<MKCoordinateRegion>, annotations: [Annotation]) {
            self.mapRect = mapRect
        }
        
        public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let annotation = annotation as? RCSAnnotation<Annotation> else {
                return nil
            }
            
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? RCSAnnotationView<Annotation>
            annotationView?.setDetailAccessory(view: annotation.view)
            
            return annotationView
        }
    }
}
