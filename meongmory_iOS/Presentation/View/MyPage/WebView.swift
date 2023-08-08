//
//  WebView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/08.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let webview = WKWebView()
        webview.load(URLRequest(url: url))
        
        return webview
    }
    func updateUIView(_ webview: WKWebView, context: UIViewRepresentableContext<WebView>) { }
}
