//
//  RCSAnnotating.swift
//  RCSMapView
//
//  Created by Ryan Spring on 12/11/21.
//

import Foundation
import SwiftUI
import MapKit

public protocol RCSAnnotating {
    associatedtype ViewType: View
    
    var title: String { get }
    var thing: CLLocationCoordinate2D { get }
    var pinColor: Color { get }
    var view: ViewType { get }
}
