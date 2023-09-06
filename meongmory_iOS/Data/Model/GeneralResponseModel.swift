//
//  GeneralResponseModel.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/09/06.
//

import Foundation

struct GeneralResponseModel<T: Codable>: Codable {
    let code, message: String?
    let stataus: Int
    let data: T?
}
