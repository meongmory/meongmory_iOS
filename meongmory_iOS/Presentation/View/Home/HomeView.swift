//
//  HomeView.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/12.
//

import SwiftUI

struct HomeView: View {
    init() {
        // 스크롤 시 NavigationBar 색상 변경 막음 - 모든 화면에 적용됨
        let appearance: UINavigationBarAppearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            ScrollView(.vertical) {
                FamilyListView()
                RecommendedView()
                BusinessView()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image("main_text_icon")
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // TODO: 알림 화면으로 이동
                }, label: {
                    Image("bell")
                })
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
