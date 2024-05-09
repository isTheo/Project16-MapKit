//
//  Capital.swift
//  Project16-MapKit
//
//  Created by Matteo Orru on 08/05/24.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var wiki: String
    
    init(title: String?, coordinate: CLLocationCoordinate2D, info: String, wiki: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.wiki = wiki
    }
    
    
    
    
}
