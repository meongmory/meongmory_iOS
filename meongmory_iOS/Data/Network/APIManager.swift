//
//  APIManager.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/09/06.
//

import Foundation
import Alamofire

private let BASE_URL = "http://52.79.149.29/"

class APIManger  {
    static let shared = APIManger()
    private var headers: HTTPHeaders?
    
    func setRefreshToken(refreshToken: String) {
        self.headers = ["Authorization": refreshToken]
    }
}

extension APIManger {
    // parameter가 있는 get
    func getData<T: Codable, U: Decodable>(urlEndpointString: String,
                                           responseDataType: U.Type,
                                           requestDataType: T.Type,
                                           parameter: T?,
                                           completionHandler: @escaping (GeneralResponseModel<U>)->Void) {
        
        guard let url = URL(string: BASE_URL + urlEndpointString) else { return }
        
        AF
            .request(url, method: .get, parameters: parameter, headers: self.headers)
            .responseDecodable(of: GeneralResponseModel<U>.self) { response in
                print(response)
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
    
    // parameter가 없는 get
    // urlEndpointString api 명세서에 있는 주소 사용
    // responseDataType에는 Codable 모델 사용
    // parameter에는 nil 사용
    func getData<U: Decodable>(urlEndpointString: String,
                               responseDataType: U.Type,
                               parameter: Parameters?,
                               completionHandler: @escaping (GeneralResponseModel<U>)->Void) {
        
        guard let url = URL(string: BASE_URL + urlEndpointString) else { return }
        
        AF
            //.request(url, method: .get, parameters: parameter, encoding: URLEncoding.queryString, headers: self.headers)
            .request(url, method: .get, parameters: parameter, encoding: URLEncoding.queryString, headers: headers)
            .responseDecodable(of: GeneralResponseModel<U>.self) { response in
                print(response)
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
          
 
    func postData<T: Codable, U: Decodable>(urlEndpointString: String,
                                            responseDataType: U.Type,
                                            requestDataType: T.Type,
                                            parameter: T?,
                                            completionHandler: @escaping (GeneralResponseModel<U>)->Void) {
        
        guard let url = URL(string: BASE_URL + urlEndpointString) else { return }
        
        AF
            .request(url, method: .post, parameters: parameter, encoder: .json, headers: self.headers)
            .responseDecodable(of: GeneralResponseModel<U>.self) { response in

                print(response)
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
    
    
    func getData<T: Codable, U: Decodable>(url: String,
                                           responseDataType: U.Type,
                                           requestDataType: T.Type,
                                           parameter: T?,
                                           completionHandler: @escaping (GeneralResponseModel<U>)->Void) {
        
        guard let url = URL(string: url) else { return }
        
        AF
            .request(url, method: .get, parameters: parameter, headers: self.headers)
            .responseDecodable(of: GeneralResponseModel<U>.self) { response in
                print(response)
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }

    // put
    func putData<T: Codable, U: Decodable>(urlEndpointString: String,
                                            responseDataType: U.Type,
                                            requestDataType: T.Type,
                                            parameter: T?,
                                            completionHandler: @escaping (GeneralResponseModel<U>)->Void) {
        
        guard let url = URL(string: BASE_URL + urlEndpointString) else { return }
        
        AF
            .request(url, method: .put, parameters: parameter, encoder: .json, headers: self.headers)
            .responseDecodable(of: GeneralResponseModel<U>.self) { response in
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
    
    // request model이 있는 delete
    func deleteData<T: Codable, U: Decodable>(urlEndpointString: String,
                                            responseDataType: U.Type,
                                            requestDataType: T.Type,
                                            parameter: T?,
                                            completionHandler: @escaping (GeneralResponseModel<U>)->Void) {
        
        guard let url = URL(string: BASE_URL + urlEndpointString) else { return }
        
        AF
            .request(url, method: .delete, parameters: parameter, encoder: .json, headers: self.headers)
            .responseDecodable(of: GeneralResponseModel<U>.self) { response in

                print(response)
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
    
    // request model이 없는 delete
    func deleteData<U: Decodable>(urlEndpointString: String,
                                            responseDataType: U.Type,
                                  completionHandler: @escaping (GeneralResponseModel<U>)->Void) {
        
        guard let url = URL(string: BASE_URL + urlEndpointString) else { return }
        print("삭제 요청 URL --> \(url)")
        AF
            .request(url, method: .delete, headers: self.headers)
            .responseDecodable(of: GeneralResponseModel<U>.self) { response in
                
                print(response)
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
    
    // patch
    func patchData<U: Decodable>(urlEndpointString: String,
                                 responseDataType: U.Type,
                                 completionHandler: @escaping (GeneralResponseModel<U>)->Void) {
        
        guard let url = URL(string: BASE_URL + urlEndpointString) else { return }
        
        AF
            .request(url, method: .patch, headers: self.headers)
            .responseDecodable(of: GeneralResponseModel<U>.self) { response in
                print(response)
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
    
    // patch (req)
    func patchData<T: Codable, U: Decodable>(urlEndpointString: String,
                                            responseDataType: U.Type,
                                            requestDataType: T.Type,
                                            parameter: T?,
                                            completionHandler: @escaping (GeneralResponseModel<U>)->Void) {
        
        guard let url = URL(string: BASE_URL + urlEndpointString) else { return }
        
        AF
            .request(url, method: .patch, parameters: parameter, encoder: .json, headers: self.headers)
            .responseDecodable(of: GeneralResponseModel<U>.self) { response in
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
    
}
