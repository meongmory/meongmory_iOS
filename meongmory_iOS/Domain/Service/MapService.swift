//
//  MapService.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/09/06.
//

import Foundation
import Alamofire


class MapService {
    private let kakaoAPIManger = KakaoAPIManager()
    
    func getAllLocation(x: String, y: String) {
        MapKind.allCases.forEach { mapKind in
            kakaoAPIManger.getLocalInfo(keyword: mapKind.getKeyword(), x: x, y: y)
        }
    }
    
    func getSearchLocation(keyword: String, x: String, y: String) {
        
    }
    
    
}
