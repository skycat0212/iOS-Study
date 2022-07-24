//
//  PlaceInformation.swift
//  MakKitStudy220719
//
//  Created by Kim Sujin on 2022/07/22.
//

import MapKit

class PlaceInformation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    
    let coordinate: CLLocationCoordinate2D
    
    init(title: String? = nil, subtitle: String? = nil, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
        super.init()
    }
}

class CompanyInformation: PlaceInformation {
    let company: Company
    
    init(company: Company, title: String? = nil, subtitle: String? = nil, coordinate: CLLocationCoordinate2D) {
        self.company = company
        
        super.init(title: title, subtitle: subtitle, coordinate: coordinate)
    }

}
