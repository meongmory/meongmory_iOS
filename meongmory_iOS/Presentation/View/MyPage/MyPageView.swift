//
//  MyPageView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/07.
//

import SwiftUI

struct MyPageView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        NavigationView {
            ScrollView {
                UserProfilView()
                MypageMenuListView()
            }
            .navigationBarTitle("마이페이지", displayMode: .inline)
        }
        
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
