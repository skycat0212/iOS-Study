//
//  MarkerView.swift
//  MakKitStudy220719
//
//  Created by Kim Sujin on 2022/07/22.
//

import MapKit

class CompanyMarkerView: MKMarkerAnnotationView {
    static let reuseIdentifier: String = "company"
    var companyInfo: CompanyInformation?
    
    override func draw(_ rect: CGRect) {
        markerTintColor = companyInfo?.company.companyColor
        glyphText = "hey"
        glyphImage = UIImage(systemName: "pencil")
        
        super.draw(rect)
    }
    
    
}
