//
//  MypageMenuListView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/08.
//

import SwiftUI

struct MypageMenuListView: View {
    var body: some View {
        List {
            getHeaderTitle(title: "계정 설정")
                .padding(.top, 20)
            Group {
                MypageMenuRow(menuDetail: MenuDetail.proVersion)
                MypageMenuRow(menuDetail: MenuDetail.logout)
                MypageMenuRow(menuDetail: MenuDetail.signout)
            }
            divider
            
            getHeaderTitle(title: "고객 지원")
            Group {
                MypageMenuRow(menuDetail: MenuDetail.notification)
                MypageMenuRow(menuDetail: MenuDetail.report)
            }
            divider

            getHeaderTitle(title: "앱 정보")
            Group {
                MypageMenuRow(menuDetail: MenuDetail.term)
                MypageMenuRow(menuDetail: MenuDetail.privacyTerm)
            }
            
        }
        .environment(\.defaultMinListRowHeight, 5)
        .frame(height: 450)
        .cornerRadius(16)
        .background(Color(red: 255/255, green: 251/255, blue: 243/255))
        .padding(.horizontal, 20)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(red: 255/255, green: 217/255, blue: 133/255), lineWidth: 0.5)
        )
        .listStyle(.plain)
    }
    
    var divider: some View {
        Divider()
            .background(Color(red: 255/255, green: 217/255, blue: 133/255))
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
    }
    
    func getHeaderTitle(title: String) -> some View {
        var header: some View {
            Text(title)
                .font(Font.system(size: 10))
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 109/255, green: 109/255, blue: 109/255))
                .frame(height: 0)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
        }
        return header
    }
}

struct MypageMenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MypageMenuListView()
    }
}
