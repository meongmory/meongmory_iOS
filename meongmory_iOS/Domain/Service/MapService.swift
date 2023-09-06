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
    
    func getSearchLocation(keyword: String, x: String, y: String, completion: @escaping ([Document]) -> Void) {
        kakaoAPIManger.getLocalInfo(keyword: keyword, x: x, y: y) { response in
            if let data = response.documents {
                completion(data)
            }
        }
    }
    
    
}
