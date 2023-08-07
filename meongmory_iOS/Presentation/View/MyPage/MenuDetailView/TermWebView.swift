//
//  TermWebView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/07.
//

import SwiftUI

enum TermType: String {
    case term = "www.naver.com" // 임시 URL값
    case privacyTerm = "www.google.com" // 임시 URL값
}

struct TermWebView: View {
    var type: TermType?
    
    var body: some View {
        Text("TermWebView - \(type?.rawValue ?? "")")
    }
}

struct TermWebView_Previews: PreviewProvider {
    static var previews: some View {
        TermWebView()
    }
}
