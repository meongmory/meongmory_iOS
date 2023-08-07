//
//  EMenuDetail.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/07.
//

import Foundation
import SwiftUI

enum MenuDetail: String {
    case proVersion = "Pro 버전"
    case logout = "로그아웃"
    case signout = "회원 탈퇴"
    
    case notification = "공지사항"
    case report = "문의하기, 오류제보"
    
    case term = "약관 안내"
    case privacyTerm = "개인정보 처리 방침"
    
    var iconName: String {
        switch self {
        case .proVersion:
          return "pro-version"
        case .logout:
            return "log-out"
        case .signout:
            return "sign-out"
            
        case .notification:
            return "notice"
        case .report:
            return "report"
            
        case .term:
            return "term"
        case .privacyTerm:
            return "privacy-term"
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .proVersion:
            ProVersionView()
        case .logout:
            EmptyView()
        case .signout:
            ProVersionView()
            
        case .notification:
            NotificationView()
        case .report:
            ReportView()
            
        case .term:
            TermWebView(type: .term)
        case .privacyTerm:
            TermWebView(type: .privacyTerm)
        }
    }
}
