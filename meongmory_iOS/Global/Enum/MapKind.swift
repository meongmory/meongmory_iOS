//
//  MapKind.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/09/06.
//

import Foundation
import UIKit
import SwiftUI

enum MapKind: String, CaseIterable {
    case cafe = "애견카페"
    case hair = "미용실"
    case food = "식료품점"
    case hospital = "병원"
}

extension MapKind {
    func getImage() -> String {
        switch self {
        case .cafe:
            return "map_cafe"
        case .hair:
            return "map_hair"
        case .food:
            return "map_food"
        case .hospital:
            return "map_hospital"
        }
    }
    
    func getSelectedImage() -> String {
        switch self {
        case .cafe:
            return "map_cafe_white"
        case .hair:
            return "map_hair_white"
        case .food:
            return "map_food_white"
        case .hospital:
            return "map_hospital_white"
        }
    }
    
    func getKeyword() -> String {
        switch self {
        case .cafe:
            return "애견카페"
        case .hair:
            return "애견미용실"
        case .food:
            return "애견용품"
        case .hospital:
            return "동물병원"
        }
    }
    
    func getWidth() -> CGFloat {
        switch self {
        case .cafe:
            return 90
        case .hair:
            return 79
        case .food:
            return 90
        case .hospital:
            return 69
        }
    }
    
    func getColor() -> Color {
        switch self {
        case .cafe:
            return Color(red: 0.38, green: 0.45, blue: 0.95)
        case .hair:
            return Color(red: 0.99, green: 0.69, blue: 0.13)
        case .food:
            return Color(red: 0.98, green: 0.44, blue: 0.4)
        case .hospital:
            return Color(red: 0.18, green: 0.56, blue: 0.98)
        }
    }
}
