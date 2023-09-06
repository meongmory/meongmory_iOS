//
//  KakaoAPIManager.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/09/06.
//

import Foundation
import Alamofire


class KakaoAPIManager {
    private let BASE_URL = "https://dapi.kakao.com/v2/local/search/keyword"
    
    let headers: HTTPHeaders = ["Authorization": Constants.KakaoHeaders]
    
    
    func getLocalInfo(keyword: String, x: String, y: String, completion: @escaping (KakaoMapResponse) -> Void) {
        let paramter: Parameters = [
            "query" : keyword,
            "x" : x,
            "y" : y,
            "radius" : "3000"
        ]
        
        guard let url = URL(string: BASE_URL) else { return }
       
        AF
            .request(url, method: .get, parameters: paramter, headers: self.headers)
            .validate()
           .responseDecodable(of: KakaoMapResponse.self) { response in
               switch response.result {
               case .success(let result):
                   print("카카오맵 데이터 조회 성공")
                   completion(result)
               case .failure(let error):
                   print("카카오맵 데이터 조회 실패")
                   print(error.localizedDescription)
                   fatalError()
               }
           }
           .resume()
   }
}
