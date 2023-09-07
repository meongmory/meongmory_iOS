//
//  MapViewModel.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/09/07.
//

import Foundation
import SwiftUI


class MapViewModel: ObservableObject {
    @Published var hairLocation: [Document] = []
    @Published var hospitalLocation: [Document] = []
    @Published var cafeLocation: [Document] = []
    @Published var foodLocation: [Document] = []
    @Published var isLoad: Bool = false
    
    @Published var selectedMapKind: MapKind?
    
    private let mapService = MapService()
    
    func loadLocation(x: String, y: String) {
        MapKind.allCases.forEach { mapKind in
            mapService.getSearchLocation(keyword: mapKind.getKeyword(), x: x, y: y) { location in
                switch mapKind {
                case .cafe:
                    self.cafeLocation = location
                case .hair:
                    self.hairLocation = location
                case.food:
                    self.foodLocation = location
                case.hospital:
                    self.hospitalLocation = location
                }
            }
        }
    }
    
}
