//
//  UserProfilView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/08.
//

import SwiftUI

struct UserProfilView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, content: {
                HStack {
                    Text("강아지 밥 주는 사람")  // TODO: 유저 닉네임으로 변경
                        .font(Font.system(size: 13))
                        .fontWeight(.semibold)
                    Spacer()
                    NavigationLink {
                        SetNotificationView()
                    } label: {
                        Text("알림설정")
                            .font(Font.system(size: 10))
                            .foregroundColor(Color.black)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                            .background(Capsule().foregroundColor(Color(red: 255/255, green: 243/255, blue: 224/255)))
                    }
                    NavigationLink {
                        EditProfileView()
                    } label: {
                        Text("프로필 수정")
                            .font(Font.system(size: 11))
                            .foregroundColor(Color.black)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                            .background(Capsule().foregroundColor(Color(red: 255/255, green: 243/255, blue: 224/255)))
                    }
                }
                
                Text("010-0000-0000")   // TODO: 유저 전화번호로 변경
                    .font(Font.system(size: 10))
            })
            .padding(.vertical, 20)
            .padding(.horizontal, 15)
            .background(Color(red: 255/255, green: 251/255, blue: 243/255))
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(red: 255/255, green: 217/255, blue: 133/255), lineWidth: 0.5)
            )
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
    }
}

struct UserProfilView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfilView()
    }
}
