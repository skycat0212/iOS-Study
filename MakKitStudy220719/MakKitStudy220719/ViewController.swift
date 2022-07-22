//
//  ViewController.swift
//  MakKitStudy220719
//
//  Created by Kim Sujin on 2022/07/19.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    
    let jejuKakao = PlaceObject(company: .kakao,
                                coordinate: kakaoJejuCoordinate)
    let secondNaver = PlaceObject(company: .naver,
                                  coordinate: naverSecondCoordinate)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        mapView.register(KakaoMarkerView.self, forAnnotationViewWithReuseIdentifier: KakaoMarkerView.identifier)
        mapView.register(NaverMarkerView.self, forAnnotationViewWithReuseIdentifier: NaverMarkerView.identifier)
        
    }
    
    @IBAction func yellowButtonClicked(_ sender: Any) {
        yellowButton.isSelected = !yellowButton.isSelected
        
        if yellowButton.isSelected {
            showKakao()
        } else {
            hideKakao()
        }
    }
    
    @IBAction func greenButtonClicked(_ sender: Any) {
        greenButton.isSelected = !greenButton.isSelected
        
        if greenButton.isSelected {
            showNaver()
        } else {
            hideNaver()
        }
    }
    
    func showKakao() {
        mapView.addAnnotation(jejuKakao)
    }
    
    func hideKakao() {
        mapView.removeAnnotation(jejuKakao)
    }
    
    func showNaver() {
        mapView.addAnnotation(secondNaver)
    }
    
    func hideNaver() {
        mapView.removeAnnotation(secondNaver)
    }
    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? PlaceObject else { return nil }
        
        let annotationView: MKAnnotationView
        
        switch annotation.company {
        case .kakao:
            annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: KakaoMarkerView.identifier) ?? MKAnnotationView()
        case .naver:
            annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: NaverMarkerView.identifier) ?? MKAnnotationView()
        }
        
        return annotationView
    }
}




class PlaceObject: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let company: Company
    
    init(company: Company, coordinate: CLLocationCoordinate2D) {
        self.company = company
        self.coordinate = coordinate
        
        super.init()
    }
}
