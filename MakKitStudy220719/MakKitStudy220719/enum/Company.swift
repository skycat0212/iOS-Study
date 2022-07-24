//
//  Company.swift
//  MakKitStudy220719
//
//  Created by Kim Sujin on 2022/07/22.
//

import UIKit

enum Company {
    case kakao
    case naver
    
    var companyColor: UIColor {
        switch self {
        case .kakao: return .yellow
        case .naver: return .green
        }
    }
}
