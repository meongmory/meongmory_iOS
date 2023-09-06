//
//  MapViewModel.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/09/07.
//

import Foundation
import SwiftUI


class MapViewModel: ObservableObject {
    @Published var allLocation: [Document] = []
    
    private let mapService = MapService()
    
    func loadLocation(x: String, y: String) {
        MapKind.allCases.forEach { mapKind in
            mapService.getSearchLocation(keyword: mapKind.getKeyword(), x: x, y: y) { location in
                self.allLocation += location
            }
        }
    }
    
}
