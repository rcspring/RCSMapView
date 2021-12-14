//
//  RCSAnnotationView.swift
//  Lunch
//
//  Created by Ryan Spring on 12/5/21.
//

import MapKit
import SwiftUI

final class RCSAnnotationView<Annotation: RCSAnnotating>: MKPinAnnotationView {
//    private var hosting: UIHostingController<Annotation.ViewType>?

    init(annotation: RCSAnnotation<Annotation>) {
        super.init(annotation: annotation, reuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        configure(for: annotation)
    }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        configure(for: annotation)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(for annotation: MKAnnotation?) {
        guard let annotation = annotation as? RCSAnnotation<Annotation> else {
//            hosting = nil
            detailCalloutAccessoryView = nil
            canShowCallout = false
            return
        }
        
        pinTintColor = UIColor(annotation.annotation.pinColor)
    }
    
    override var annotation: MKAnnotation? {
        get { super.annotation }
        set {
            configure(for: newValue)
            super.annotation = newValue
        }
    }
    
    func setDetailAccessory(view: Annotation.ViewType?) {
            if let view = view {
                let hosting = UIHostingController(rootView: view)
                hosting.view.clipsToBounds = false
                detailCalloutAccessoryView = RCSPaddingView(containedView: hosting.view)
                canShowCallout = true
            } else {
                detailCalloutAccessoryView = nil
                canShowCallout = false
            }
    }
}
