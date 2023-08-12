//
//  HomeView.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/12.
//

import SwiftUI

struct HomeView: View {
    init() {
        // 스크롤 시 NavigationBar 색상 변경 막음
        let appearance: UINavigationBarAppearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                // 강아지네
                
                // 보러가기
                // 사업자
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}, label: {
                        Image("main_text_icon")
                    })
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
