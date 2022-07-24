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
    
    let jejuKakao = CompanyInformation(company: .kakao,
                                coordinate: kakaoJejuCoordinate)
    let secondNaver = CompanyInformation(company: .naver,
                                  coordinate: naverSecondCoordinate)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setMapView()
    }
    
    func setMapView() {
        mapView.delegate = self
        mapView.register(CompanyMarkerView.self, forAnnotationViewWithReuseIdentifier: CompanyMarkerView.reuseIdentifier)
    }
    
    @IBAction func yellowButtonClicked(_ sender: Any) {
        yellowButton.isSelected = !yellowButton.isSelected
        setKakaoMarkerStatus(isHidden: !yellowButton.isSelected)
    }
    
    @IBAction func greenButtonClicked(_ sender: Any) {
        greenButton.isSelected = !greenButton.isSelected
        setNaverMarkerStatus(isHidden: !greenButton.isSelected)
    }
    
    func setKakaoMarkerStatus(isHidden: Bool) {
        if !isHidden {
            mapView.addAnnotation(jejuKakao)
        } else {
            mapView.removeAnnotation(jejuKakao)
        }
    }
    
    func setNaverMarkerStatus(isHidden: Bool) {
        if !isHidden {
            mapView.addAnnotation(secondNaver)
        } else {
            mapView.removeAnnotation(secondNaver)
        }
    }

    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? CompanyInformation else {
            print("mapkit delegate ConpanyInformation casting error")
            return nil
        }
        
        guard let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: CompanyMarkerView.reuseIdentifier) as? CompanyMarkerView else {
            print("mapkit delegate ConpanyMarkerView casting error")
            return nil
        }
        annotationView.companyInfo = annotation
        
        return annotationView
    }
}



