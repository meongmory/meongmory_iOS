//
//  MyPageView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/07.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        ScrollView {
            UserProfilView()
            MypageMenuListView()
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("마이페이지")
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
