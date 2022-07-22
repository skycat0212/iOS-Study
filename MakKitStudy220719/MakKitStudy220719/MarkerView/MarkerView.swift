//
//  MarkerView.swift
//  MakKitStudy220719
//
//  Created by Kim Sujin on 2022/07/22.
//

import MapKit

class KakaoMarkerView: MKMarkerAnnotationView {
    static let identifier: String = "kakao"
    
//    var titleLabel: UILabel = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        return $0
//    }(UILabel())
    
    override func draw(_ rect: CGRect) {
        // reuse되므로 init 시점이 아닌 draw 시점마다 세팅해야 함
        markerTintColor = .yellow
        glyphImage = UIImage(systemName: "pencil")

        super.draw(rect)
    }
}


class NaverMarkerView: MKMarkerAnnotationView {
    static let identifier: String = "naver"
    
    override func draw(_ rect: CGRect) {
        markerTintColor = .green
        super.draw(rect)
    }
}
