//
//  TermWebView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/07.
//

import SwiftUI

enum TermType: String {
    case term = "https://www.naver.com" // 임시 URL값
    case privacyTerm = "https://www.google.com" // 임시 URL값
}

struct TermWebView: View {
    var type: TermType?
    
    var body: some View {
        WebView(url: type?.rawValue ?? "https://www.naver.com")
        .navigationTitle(type == .term ? "약관 안내" : "개인정보 처리 방침")
    }
}

struct TermWebView_Previews: PreviewProvider {
    static var previews: some View {
        TermWebView()
    }
}
