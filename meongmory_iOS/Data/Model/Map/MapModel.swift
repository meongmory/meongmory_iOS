//
//  MapModel.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/09/06.
//

import Foundation

struct KakaoMapResponse: Codable {
    let documents: [Document]?
    let meta: Meta
}

struct Document: Codable {
    let addressName, categoryGroupCode, categoryGroupName, categoryName: String?
    let distance, id, phone, placeName: String?
    let placeURL: String?
    let roadAddressName, x, y: String?

    enum CodingKeys: String, CodingKey {
        case addressName = "address_name"
        case categoryGroupCode = "category_group_code"
        case categoryGroupName = "category_group_name"
        case categoryName = "category_name"
        case distance, id, phone
        case placeName = "place_name"
        case placeURL = "place_url"
        case roadAddressName = "road_address_name"
        case x, y
    }
}

struct Meta: Codable {
    let totalCount, pageableCount: Int
    let isEnd: Bool
    let sameName: SameName
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case pageableCount = "pageable_count"
        case isEnd = "is_end"
        case sameName = "same_name"
    }
}

struct SameName: Codable {
    let region: [String]?
    let keyword, selectedRegion: String
    
    enum CodingKeys: String, CodingKey {
        case keyword ,region
        case selectedRegion = "selected_region"
    }
}
